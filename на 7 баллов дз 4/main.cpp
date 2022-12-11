#include <fstream>
#include <iostream>
#include <mutex>
#include <pthread.h>
#include <unistd.h>
#include <vector>
//блок для обращения к катологу.
std::mutex block_catalog;
// блок для строоки вывода.
std::mutex string_block;
// строка с информацией о потоках.
std::string info = "";
// структура книги
struct Book {
    int invent_number;
    int row;
    int bookshelf_number;
    int number_in_bookshelf;

    Book(int invent_number, int row, int bookshelf_number, int number_in_bookshelf) {
        this->invent_number = invent_number;
        this->row = row;
        this->bookshelf_number = bookshelf_number;
        this->number_in_bookshelf = number_in_bookshelf;
    }
    Book() {
        invent_number = -1;
        row = -1;
        bookshelf_number = -1;
        number_in_bookshelf = -1;
    }
};
// структура для передачи нескольких параметров в pthread_create
struct argStruct {
    int row_number;
    std::vector<Book> books;
    std::vector<std::vector<std::vector<Book>>> catalog;
    argStruct(int row_number, std::vector<Book> &books, std::vector<std::vector<std::vector<Book>>> &catalog) {
        this->row_number = row_number;
        this->catalog = catalog;
        this->books = books;
    }
};
// человек относит книги с одним рядом в библиотеку.
void bringBooksToTheRow(argStruct arguments) {
    for (auto i : arguments.books) {
        if (i.row == arguments.row_number) {
            auto temp = i;
            // время ходьбы.
            sleep(i.row % 3);
            block_catalog.lock();
            arguments.catalog[arguments.row_number][i.bookshelf_number][i.number_in_bookshelf] = temp;
            block_catalog.unlock();
            string_block.lock();
            info += "Человек " + std::to_string(i.row) + " положил книгу с инвент.номером " + std::to_string(temp.invent_number)
                + " в ряд " + std::to_string(i.row) + " в шкаф "
                + std::to_string(temp.bookshelf_number) + " под номером " + std::to_string(i.number_in_bookshelf) + "\n";
            string_block.unlock();
        }
    }
}
// Каталог, где есть вектор книг и трехмерный вектор книг - каталог.
class Catalog {
 public:
    std::vector<Book> books;
    int row_count;
    int bookshelf_count;
    int books_count;
    std::vector<std::vector<std::vector<Book>>> catalog;
    std::vector<pthread_t> threads;

    Catalog(int row_count, int bookshelf_count, int books_count) {
        this->row_count = row_count;
        this->bookshelf_count = bookshelf_count;
        this->books_count = books_count;
        catalog.resize(row_count);
        for (int i = 0; i < row_count; i++) {
            catalog[i].resize(bookshelf_count);
            for (int j = 0; j < bookshelf_count; j++) {
                catalog[i][j].resize(books_count);
            }
        }
        threads.resize(row_count);
    };
    // заполнения вектора книг книгами.
    void feelBooks(int invent_number, int row, int bookshelf_number, int number_in_bookshelf) {
        books.emplace_back(invent_number, row, bookshelf_number, number_in_bookshelf);
    }
    // перенос книг в библиотеку согласно рядам.
    void feelLibrary() {
        for (auto i = 0; i < row_count; i++) {
            auto *args = new argStruct(i, books, catalog);
            pthread_create(&threads[i], nullptr, reinterpret_cast<void *(*) (void *)>(bringBooksToTheRow), args);
        }
        for (auto i = 0; i < row_count; i++) {
            pthread_join(threads[i], nullptr);
        }
    }
};

int main(int argc, char *argv[]) {
    int row;
    int bookshelf_number;
    int number_in_bookshelf;
    int invent_number;
    // если ничего не введено, то ввод с консоли.
    if (argc == 1) {
        std::cout << "Введите сначала кол-во рядов, затем кол-во шкафов в каждом ряде, затем количество книг в каждом шкафу";
        std::cin >> row >> bookshelf_number >> number_in_bookshelf;
        auto catalog = new Catalog(row, bookshelf_number, number_in_bookshelf);
        int size = row * bookshelf_number * number_in_bookshelf;
        std::cout << "Введите порядковый номер книги, затем номер ряда, номер шкафа, номер книги в шкафу";
        for (auto i = 0; i < size; i++) {
            std::cin >> invent_number >> row >> bookshelf_number >> number_in_bookshelf;
            if (row > catalog->row_count || invent_number < 0 || bookshelf_number > catalog->bookshelf_count
                || bookshelf_number < 0 || number_in_bookshelf > catalog->books_count || number_in_bookshelf < 0) {
                throw std::exception();
            }
            catalog->feelBooks(invent_number, row, bookshelf_number, number_in_bookshelf);
        }
        catalog->feelLibrary();
        std::cout << info;
    } else if (argc == 3) { // если ввели пути к файлам, то ввод и вывод с файлов.
        try {
            std::ifstream input(argv[1]);
            input >> row >> bookshelf_number >> number_in_bookshelf;
            auto catalog = new Catalog(row, bookshelf_number, number_in_bookshelf);
            int size = row * bookshelf_number * number_in_bookshelf;
            for (auto i = 0; i < size; i++) {
                input >> invent_number >> row >> bookshelf_number >> number_in_bookshelf;
                if (row > catalog->row_count || invent_number < 0 || bookshelf_number > catalog->bookshelf_count
                    || bookshelf_number < 0 || number_in_bookshelf > catalog->books_count || number_in_bookshelf < 0) {
                    throw std::exception();
                }
                catalog->feelBooks(invent_number, row, bookshelf_number, number_in_bookshelf);
            }
            input.close();
            std::ofstream output(argv[2]);
            catalog->feelLibrary();
            std::cout << info;
            output << info;
            output.close();
        } catch(std::exception& e) {
            std::cout << "не могу откыть файл.";
        }
    }
}

package TodoPicker

import "core:fmt"
import rand "core:math/rand"
import "core:os"
import "core:strings"

main :: proc() {
	if (len(os.args) == 1) {
		fmt.println("ERROR: Must provide the name of the todo list (without .txt)")
		return
	}

	if (len(os.args) == 2 && os.args[1] == "help") {

		fmt.println("Use: TodoPicker name/path list name/path to list file")
		fmt.println("Help: TodoPicker help")
		return

	}

	FilePath: string
	if (len(os.args) == 3) {

		if (os.args[1] == "name") {

			List := os.args[1]
			Temp := []string{"lists/", List, ".txt"}
			FilePath := strings.concatenate(Temp[:])

		} else if (os.args[1] == "path") {
			FilePath = os.args[2]
		} else {
			fmt.println("ERROR: First argument must be \"name\" or \"path\"")
		}
	} else {
		fmt.println(
			"ERROR: Incorrect format. Run \"TodoPicker help\" to see how to use the program",
		)
		return
	}

	FileData, Err := os.read_entire_file_from_filename(FilePath)
	if Err == false {
		fmt.printfln("ERROR: Could not open file %v!", FilePath)
		return
	};defer delete(FileData)
	// NOTE(ingar): It's probably bad practice to string operations on the same line, but to me this
	// is fine

	FileString := string(FileData)
	Todos := strings.split(FileString, "TODO: ")
	RandomPick := rand.choice(Todos)
	fmt.println(RandomPick)
}

package TodoPicker

import sp "SubPackage"
import "core:fmt"

todo :: struct {
	Text: string,
}

main :: proc() {
	NewTodo: todo
	NewTodo.Text = "Hello, todo struct!"

	fmt.println(NewTodo.Text)

	foo()

	sp.bar()
}

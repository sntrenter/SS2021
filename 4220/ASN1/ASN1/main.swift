//Sam Trenter
//4220
//SS21
//used stack overflow and apple docs

// 1 - Declare two empty Int arrays. Loop through the numbers
//0-100. If a number is divisible by 3, add it to the first array.
//If it is divisible by 5, add it to the other array. Print the
//resulting arrays.

var div3:[Int] = []
var div5:[Int] = []

for i in 0...100
{
    if(i % 3 == 0)
    {
        div3.append(i)
    }
    if(i % 5 == 0)
    {
        div5.append(i)
    }
}

print(div3,div5)



// 2 - Write a simple struct Person with the properties name,
//address, age, favorite food. Add a description method or
//computed property that prints all the values in a sentence. Call
//your method.

struct Person {
    var name = ""
    var address = ""
    var age = -1
    var favoriteFood = ""
    func description()
    {
        //print("Name: \(name)")
        //print("Address: \(address)")
        //print("Age: \(age)")
        //print("Favorite Food: \(favoriteFood)")
        print("\(name)'s address is \(address), they are \(age) years old and their favorite food is \(favoriteFood)")
    }
}

var person = Person(name: "jake",address: "32 greeneway", age: 27, favoriteFood: "Ribeye")
person.description()



let camelCasedString = "whatEvenAmI"
// 3 - Write a method that converts a camel-cased
//(exampleCamelCase) String to a snake-cased String
//(example_snake_cased_string). Call it with the following and
//print the result.

//Assumes proper Camal Case
func toLower(str: String) -> String{
    var newstr = ""
    for i in str
    {
        if i.isUppercase 
        {
            newstr.append("_")
            newstr.append(i.lowercased())
        }
        else
        {
            newstr.append(i)
        }
    }

    return newstr
}
print(toLower(str:camelCasedString))

//No number four?

let numbers = [70, 5, 1, 3, 0, -5, 25, 500, 100, 14]
// 5 - Sum the numbers above using `reduce`. Print the result.
print(numbers.reduce(0,+))

// 6 - Use forEach and print out each number in numbers that is
//divisible by 15
numbers.forEach{i in
    if i % 15 == 0
    {
        print(i)
    }
}

// 7 - Map over the numbers array to multiply each element by a
//factor of 100 and print the resulting array.
print(numbers.map {$0 * 100})

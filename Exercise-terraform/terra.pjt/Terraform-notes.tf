Save PLAN on LOcAl Host in Terraform:
To save your plan, you use the command "terraform plan -out=saveplan". 


Another terraform operatiion is "terraform console" 
terraform console 'rearranges values or parameters', transforming "lists" to "maps" under different specific operations or headings. It runs on the CLI without the use of any file. lets see the following examples:

Zipmap = it combines two lists together. That is it creates a map after zipping two strings. eg

 zipmap(["one", "two"],[0,3])
{
  "one" = 0
  "two" = 3

 zipmap(["horse", "dog"], ["white", "brown"])
{
  "dog" = "brown"
  "horse" = "white"

max = is a function that displays just the maximum value. eg

 max(9, 19, 12)
19

Distinct = rearranges values in order and eliminates duplicates. eg

distinct(["a", "b", "c", "d", "a", "c", "d", "b"])
tolist([
  "a",
  "b",
  "c",
  "d",
])

flaten = functions similar to distinct but eliminates null. eg

flatten([["a", "b"], [], ["c"]])
[
  "a",
  "b",
  "c",
]

merge = merges sets of value in a list in the form of a map. eg

merge({a="b", c="d", e="f", c="g"})
{
  "a" = "b"
  "c" = "g"
  "e" = "f"
}

formatedate = reproduces the date in a clear readable form. eg

formatdate("DD MMM YYYY hh:mm ZZZ", "2018-01-02T23:12:01Z")
"02 fJan 2018 23:12 UTC"


package main

import (
	"fmt"
	"io"
	"io/ioutil"
	"math/rand"
	"os"
	"os/exec"
	"path/filepath"
	"time"
	"github.com/joho/godotenv"
)

func goDotEnvVariable(key string) string {

  // load .env file
  // err := godotenv.Load(".env")
	// REPLACE WITH THE SCRIPT THING
  err := godotenv.Load("/home/swider/.config/wpShuffler/.env")

  if err != nil {
    fmt.Println("Error loading .env file")
    fmt.Println("Error run the build.sh before running the program")
		// ASK USER TO RUN SETUP SCRIPT
  }

  return os.Getenv(key)
}

func main() {


	// use godot package to load/read the .env file and
	// return the value of the key
	
	    // os package
	
	  // godotenv package
	source := goDotEnvVariable("SOURCEDIR")
	destination := goDotEnvVariable("DESTDIR")
	filename := goDotEnvVariable("NAME")
	
	sourceDir := source // Replace with your source directory
	destDir := destination // Replace with your destination directory

	files, err := ioutil.ReadDir(sourceDir)
	if err != nil {
		fmt.Println("Error reading directory:", err)
		return
	}

	rand.Seed(time.Now().UnixNano())
	randomIndex := rand.Intn(len(files))

	selectedFile := files[randomIndex]
	sourceFile := filepath.Join(sourceDir, selectedFile.Name())
	// destFile := filepath.Join(destDir, selectedFile.Name())
	destFile := filepath.Join(destDir, filename)


	err = copyFile(sourceFile, destFile)
	if err != nil {
		fmt.Println("Error copying file:", err)
		return
	}

	fmt.Println("File copied successfully:", selectedFile.Name())
	// restart hsetroot
	output, err := exec.Command("hsetroot","-fill",destFile).Output()
	if err!=nil {
	    fmt.Println(err.Error())
	}

	fmt.Println(string(output))

}

func copyFile(src, dst string) (err error) {
	in, err := os.Open(src)
	if err != nil {
		return
	}
	defer in.Close()

	out, err := os.Create(dst)
	if err != nil {
		return
	}
	defer func() {
		if cerr := out.Close(); cerr != nil {
			err = cerr
		}
	}()

	_, err = io.Copy(out, in)
	if err != nil {
		return
	}

	err = out.Sync()
	return
}

document.addEventListener("DOMContentLoaded",function(e)
{
    console.log("Loaded");
    loadImages();
});


var imageNums = 15;

function loadImages()
{

    var columns = document.getElementsByClassName("column");
    var columnNum = columns.length;

    console.log(columnNum);

    
    for(var i = 0; i< imageNums; i++)
    {
        var newImg = document.createElement("img");

        newImg.src ="./image/img"+(i)+".jpg";
        newImg.id = i;

        columns[i%columnNum].appendChild(newImg);
    }



}


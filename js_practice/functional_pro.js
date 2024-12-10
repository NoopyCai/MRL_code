// const array = [1, 2, 3]

// function removeLastItem(arr){
//     const newArray = [].concat(arr);
//     newArray.pop();
//     return newArray;
// }

// function mutiplyBy2(arr){
//     return arr.map(item => item * 2);
// }
// console.log(removeLastItem(array));
// console.log(mutiplyBy2(array));
// console.log(array)

const obj = {name: 'Andrei'}

function clone(obj){
    return {...obj};
}

function updateName(obj){
    const obj2 = clone(obj);
    obj2.name = 'Nana';
    return obj2;
}

const updateObj = updateName(obj);

console.log(obj, updateObj);
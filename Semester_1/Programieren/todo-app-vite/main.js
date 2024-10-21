import './style.scss'

import { Collapse } from 'bootstrap'

function startApplication() {


  const createtodoButton = document.querySelector('#create-todo-button')
  
  function createToDo () {
   const todotitleinput = document.querySelector( '#todo-title');
   const tododateinput = document.querySelector( '#todo-due-date');
   const todonoteinput = document.querySelector( '#todo-note');

   const newtodo = (
    title: todotitleinput.value;
    duedate: tododateinput.value;
    note: todonoteinput.value;
   )


   console.log ( todotitleinput.value );
   console.log ( tododateinput.value );
   console.log ( todonoteinput.value );
  }

createtodoButton.addEventListener('click', createToDo );


console.log( createToDoButton );
}
document.addEventListener( 'DOMcontentLoaded', startApplication)
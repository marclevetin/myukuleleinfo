import React, {Component} from 'react'

const TextBlock = (props) => {
  return(
    <div className='textrow'>
      <h1>{props.title}</h1>
      <p>{props.body}</p>
    </div>
  )
}

export default TextBlock;

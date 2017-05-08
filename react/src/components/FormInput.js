import React from 'react';

const FormInput = (props) => {
  return (
    // <form onSubmit={props.handleFormSubmit}>
    <form>
      <input
        type="text"
        placeholder="Search for a ukulele"
        content = {props.content}
        value = {props.name}
        onChange = {props.handleChange}
      />
    </form>
  )
}

export default FormInput;

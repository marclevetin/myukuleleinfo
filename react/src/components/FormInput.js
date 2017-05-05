import React from 'react';

const FormInput = (props) => {
  return (
    <form onSubmit={props.handleFormSubmit}>
      <input
        type="text"
        placeholder="Ukulele search"
        value = {props.name}
        onChange = {props.handleChange}
      />
      <input type="submit" value="Search" />
    </form>
  )
}

export default FormInput;

function getUserUkuleles() {
  return fetch("/api/v1/ukuleles", {
    method: 'GET',
    headers: {
      'Content-Type': 'application/json'
    },
    credentials: 'same-origin'
  })
}

function postUserUkulele(payload) {
  return fetch(payload2url("/api/v1/addUkulele", payload), {
    method: 'GET',
    headers: {
      'Content-Type': 'application/json'
    },
    credentials: 'same-origin'
    // body: JSON.stringify(payload)
  })
}

function payload2url(path, payload) {
  var keys = Object.keys(payload)
  keys.forEach((key, index) => {
      if (index === 0) {
        path += `?${key}=${payload[key]}`
      } else {
        path += `&${key}=${payload[key]}`
      }
  })
  return path
}

export {
  getUserUkuleles,
  postUserUkulele
}

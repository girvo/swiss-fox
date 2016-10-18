/** @jsx h */

/**
 * Client-side entrypoint
 */

const { h, render } = require('preact')

function Main (props) {
  return <div>Hello, {props.name}!</div>
}

render(<Main name='Josh' />, document.body)

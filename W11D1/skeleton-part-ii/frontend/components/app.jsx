import { Route } from "react-router-dom";
import { HashRouter } from "react-router-dom";

const App = () => (
  <Route path="/" component={PokemonIndexContainer} />
)

const Root = ({ store }) => (
  <Provider store={store}>
    <HashRouter>
      <App/>
    </HashRouter>
  </Provider>
)
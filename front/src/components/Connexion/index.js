import React, {useState, useEffect} from 'react';
import './styles.scss'
import axios from 'axios'

import './styles.scss'

const Connexion = () => {

  const [logged, setLogged] = useState(false)

  const [email, setEmail ] = useState("");
  const [password, setPassword] = useState("");


  function handleSubmit (event) {
      // annule le refresh de la page
      event.preventDefault()
      const token = email + password
      //requete axios
      axios({
        method: 'post',
        url: 'http://localhost:5000/login',
        data: {
          email: email,
          password: password
        }
      }, { headers: {'Authorization': `Bearer ${token}`}} )
      .then((res) => {
        console.log(res.data);
        setLogged = true
      })
      .catch((e) => {
        console.log("erreur lors du login", e);
      })
  }

  return (
    <section className="connexion">
      <div className="admin-login">
        <h1>Connexion</h1>
        <form className="admin-login-form" onSubmit={handleSubmit}>
          <div className="admin-login-email">
            <input
              onChange={(e) => setEmail(e.target.value)}
              value={email}
              labelPosition='right'
            />
          </div>
          <div className="admin-login-password">
            <input icon='lock'
              value={password}
              onChange={(e)=> setPassword(e.target.value)}
               />
          </div>
          <div className="admin-login-submit">
              <button  type="submit">Se connecter</button>
          </div>
        </form>
      </div>
    </section>
  )
};

export default Connexion;

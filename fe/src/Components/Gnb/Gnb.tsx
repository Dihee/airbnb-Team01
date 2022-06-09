import userImg from "Asset/userImg.svg";
import drawerMenu from "Asset/drawerMenu.svg";
import logo from "Asset/logo.svg";
import { Buttons, Container, Logo, Menu, Menus } from "Components/Gnb/Gnb.styled";
import { Img } from "Components/Common/styled";
import { NavLink } from "react-router-dom";
import { useState } from "react";
import Login from "Components/Login/Login";

interface GnBType {
  contents?: any;
}

export default function Gnb({ contents }: GnBType) {
  const [loginState, setLoginState] = useState(false);
  const toggleLoginButton = () => setLoginState(!loginState);

  return (
    <Container flex={true} justify="space-between">
      <Logo>
        <NavLink to="/">
          <Img src={logo} width="88px" height="46px" />
        </NavLink>
      </Logo>
      {contents ? (
        contents
      ) : (
        <Menus flex={true}>
          <Menu>숙소</Menu>
          <Menu>체험</Menu>
          <Menu>온라인 체험</Menu>
        </Menus>
      )}
      <Buttons flex={true} justify="center" align="center">
        <Img src={drawerMenu} width="18px" height="18px" alt="메뉴" />
        <Img src={userImg} width="32px" height="32px" alt="로그인" onClick={toggleLoginButton} />
        {loginState && <Login setLoginState={setLoginState} />}
      </Buttons>
    </Container>
  );
}

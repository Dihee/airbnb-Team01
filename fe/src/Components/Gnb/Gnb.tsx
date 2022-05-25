import userImg from "Asset/userImg.svg";
import drawerMenu from "Asset/drawerMenu.svg";
import logo from "Asset/logo.svg";
import { Buttons, Container, Img, Logo, Menu, Menus } from "Components/Gnb/Gnb.styled";

export default function Gnb() {
  return (
    <Container flex={true} justify="space-between">
      <Logo>
        <Img src={logo} width="88" height="46" />
      </Logo>
      <Menus flex={true}>
        <Menu>숙소</Menu>
        <Menu>체험</Menu>
        <Menu>온라인 체험</Menu>
      </Menus>
      <Buttons flex={true} justify="center" align="center">
        <Img src={drawerMenu} width="18" height="18" alt="메뉴" />
        <Img src={userImg} width="32" height="32" alt="로그인" />
      </Buttons>
    </Container>
  );
}

import userImg from "Asset/userImg.svg";
import drawerMenu from "Asset/drawerMenu.svg";
import logo from "Asset/logo.svg";
import { Buttons, Container, Logo, Menu, Menus } from "Components/Gnb/Gnb.styled";
import { Img } from "Components/Common/styled";

export default function Gnb() {
  return (
    <Container flex={true} justify="space-between">
      <Logo>
        <Img src={logo} width="88px" height="46px" />
      </Logo>
      <Menus flex={true}>
        <Menu>숙소</Menu>
        <Menu>체험</Menu>
        <Menu>온라인 체험</Menu>
      </Menus>
      <Buttons flex={true} justify="center" align="center">
        <Img src={drawerMenu} width="18px" height="18px" alt="메뉴" />
        <Img src={userImg} width="32px" height="32px" alt="로그인" />
      </Buttons>
    </Container>
  );
}

import { MODAL_REF_IDX } from "Helpers/constant";
import { useOutsideClick } from "Hook/useOutsideClick";
import { useRef } from "react";
import { Content, LoginContainer } from "./Login.styled";

interface LoginType {
  setLoginState: (item: boolean) => void;
}

export default function Login({ setLoginState }: LoginType) {
  const loginRef: React.MutableRefObject<HTMLElement[] | null[]> = useRef([]);

  const handleOutsideClick = () => {
    setLoginState(false);
  };

  useOutsideClick(loginRef, handleOutsideClick);

  return (
    <LoginContainer ref={(el) => loginRef && (loginRef.current[MODAL_REF_IDX] = el)}>
      <Content>로그인</Content>
    </LoginContainer>
  );
}

import { applyFlex, FlexBoxType } from "Helpers/utils";
import styled from "styled-components";

export const Container = styled.div`
  ${({ flex, justify }: FlexBoxType) => applyFlex({ flex, justify })};
  padding: 24px 0;
`;

export const Menus = styled.ul`
  ${({ flex }: FlexBoxType) => applyFlex({ flex })};
  padding: 12px 0;
  font-size: 16px;
`;

export const Menu = styled.ul`
  margin-right: 24px;
  cursor: pointer;
`;

export const Buttons = styled.ul`
  margin-right: 80px;
  background-color: #fff;
  width: 76px;
  height: 40px;
  border-radius: 30px;
  ${({ flex, justify, align }: FlexBoxType) => applyFlex({ flex, justify, align })}
`;

export const Logo = styled.div`
  margin-left: 80px;
  cursor: pointer;
`;

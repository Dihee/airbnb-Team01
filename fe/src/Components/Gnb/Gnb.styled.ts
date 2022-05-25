import { applyFlex, FlexBoxType } from "Helpers/utils";
import styled from "styled-components";

interface imgType {
  width: string;
  height: string;
}

interface backgroundType {
  width: string;
  height: string;
  url: string;
}

export const BackgroundImg = styled.div`
  ${({ width, height, url }: backgroundType) => {
    return `background: url(${url}); width:${width}px; height:${height}px`;
  }};
`;

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
`;

export const Buttons = styled.ul`
  margin-right: 80px;
  background-color: #fff;
  width: 76px;
  height: 40px;
  border-radius: 30px;
  ${({ flex, justify, align }: FlexBoxType) => applyFlex({ flex, justify, align })}
`;

export const Img = styled.img`
  ${({ width, height }: imgType) => {
    return `width:${width}px; height:${height}px`;
  }};
  margin-left: 4px;
`;

export const Logo = styled.div`
  margin-left: 80px;
`;

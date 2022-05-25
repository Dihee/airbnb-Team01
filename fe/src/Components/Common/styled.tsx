import styled from "styled-components";

interface imgType {
  width: string;
  height: string;
  margin?: string;
}

export const Img = styled.img`
  ${({ width, height }: imgType) => {
    return `width:${width}; height:${height}`;
  }};
  margin-left: 4px;
  ${(props: imgType) => {
    if (!props.margin) {
      return;
    }

    return `margin:${props.margin}`;
  }};
  cursor: pointer;
`;

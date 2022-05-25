import { applyFlex, FlexBoxType } from "Helpers/utils";
import styled from "styled-components";

export const Container = styled.div`
  ${({ flex, justify }: FlexBoxType) => applyFlex({ flex, justify })};
  width: 916px;
  height: 76px;
  margin-top: 110px;
  margin-left: 262px;
  background-color: #fff;
  border-radius: 30px;
  padding: 16px;
`;

export const DateArea = styled.div`
  ${({ flex, justify, align }: FlexBoxType) => applyFlex({ flex, justify, align })};
  width: 361px;
  border-right: 1px solid #e0e0e0;
`;

export const PriceArea = styled.div`
  ${({ flex, justify, align }: FlexBoxType) => applyFlex({ flex, justify, align })};
  width: 257px;
  border-right: 1px solid #e0e0e0;
`;

export const HeadCountArea = styled.div`
  ${({ flex, justify, align }: FlexBoxType) => applyFlex({ flex, justify, align })};
  width: 298px;
`;

export const SearchButton = styled.div`
  width: 40px;
  height: 40px;
  background: #e84c60;
  border-radius: 30px;
  ${({ flex, align }: FlexBoxType) => applyFlex({ flex, align })}
`;

export const ActiveContent = styled.div`
  color: #010101;
`;
export const InActiveContent = styled.div`
  color: #4f4f4f;
`;

export const ContentContainer = styled.div`
  margin-left: 24px;
`;
export const ContentHeader = styled.header`
  font-weight: 700;
  font-size: 12px;
  line-height: 17px;
  margin-bottom: 4px;
`;

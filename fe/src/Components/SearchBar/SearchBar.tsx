import {
  Container,
  DateArea,
  HeadCountArea,
  PriceArea,
  InActiveContent,
  ActiveContent,
  ContentHeader,
  ContentContainer,
} from "./SearchBar.styled";
import cancelButton from "Asset/cancelButton.svg";
import searchButton from "Asset/searchButton.svg";
import activeSearchButton from "Asset/activeSearchButton.svg";
import { Img } from "Components/Common/styled";

export default function SearchBar() {
  return (
    <Container flex={true} justify="space-between">
      <DateArea flex={true} justify="space-between" align="center">
        <ContentContainer>
          <ContentHeader>체크인</ContentHeader>
          {/* 체크인 상태 값이 입력되면 Active, 없으면 InActive */}
          {false ? (
            <ActiveContent>날짜입력해주기</ActiveContent>
          ) : (
            <InActiveContent>날짜입력</InActiveContent>
          )}
        </ContentContainer>
        <ContentContainer>
          <ContentHeader>체크아웃</ContentHeader>
          {/* 체크아웃 상태 값이 입력되면 Active, 없으면 InActive */}
          {false ? (
            <ActiveContent>날짜입력해주기</ActiveContent>
          ) : (
            <InActiveContent>날짜입력</InActiveContent>
          )}
        </ContentContainer>
        <Img src={cancelButton} width="20px" height="20px" margin="0 33px 0 0" />
      </DateArea>
      <PriceArea flex={true} justify="space-between" align="center">
        <ContentContainer>
          <ContentHeader>요금</ContentHeader>
          {/* 금액 상태 값이 입력되면 Active, 없으면 InActive */}
          {false ? (
            <ActiveContent>입력된 금액</ActiveContent>
          ) : (
            <InActiveContent>금액대 설정</InActiveContent>
          )}
        </ContentContainer>
        <Img src={cancelButton} width="20px" height="20px" margin="0 33px 0 0" />
      </PriceArea>
      <HeadCountArea flex={true} justify="space-between" align="center">
        <ContentContainer>
          <ContentHeader>인원 수</ContentHeader>
          {/* 인원수 상태 값이 입력되면 Active, 없으면 InActive */}
          {false ? <ActiveContent>게스트 n명</ActiveContent> : <InActiveContent>게스트 추가</InActiveContent>}
        </ContentContainer>
        <Img src={cancelButton} width="20px" height="20px" />
        {/* 검색창 활성화시 active */}
        {false ? (
          <Img src={activeSearchButton} width="90px" height="42px" />
        ) : (
          <Img src={searchButton} width="40px" height="40px" />
        )}
      </HeadCountArea>
    </Container>
  );
}

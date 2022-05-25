interface FlexBoxPropertyType {
  justify?: string;
  align?: string;
  direction?: string;
  wrap?: string;
}

export interface FlexBoxType extends FlexBoxPropertyType {
  flex: boolean;
}

export function applyFlex({ flex, justify, align, direction, wrap }: FlexBoxType) {
  return (
    flex &&
    `${getFlexTemplate({ justify, align, direction, wrap })}
    `
  );
}

function getFlexTemplate({ justify, align, direction, wrap }: FlexBoxPropertyType) {
  justify = justify || "start";
  align = align || "stretch";
  direction = direction || "row";
  wrap = wrap || "nowrap";
  return `
    display: flex;
    justify-content: ${justify};
    align-items: ${align};
    flex-direction: ${direction};
    flex-wrap:${wrap}
  `;
}

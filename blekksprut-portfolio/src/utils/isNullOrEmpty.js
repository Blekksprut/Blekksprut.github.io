import isNil from "is-nil";

// Function to test if null, undefined, or empty string
function isNullOrEmpty(variable) {
  return (
    isNil(variable) ||
    variable === "" ||
    !variable ||
    Object.keys(variable).length === 0
  );
}
export { isNullOrEmpty };

export const hash = (str: string) => {
  return str.split('').reduce((prev, curr) => (Math.imul(31, prev) + curr.charCodeAt(0)) | 0, 0)
}

const arrayToTree = (menuItems) => {
  const map = new Map();

  menuItems.forEach((item) => {
    map.set(item.id, { ...item, children: [] });
  });

  const menuTree = [];

  menuItems.forEach((item) => {
    const menuItem = map.get(item.id);
    if (menuItem) {
      if (!item.parentId || !map.has(item.parentId)) {
        menuTree.push(menuItem);
      } else {
        const parentItem = map.get(item.parentId);
        if (parentItem) {
          parentItem.children.push(menuItem);
        }
      }
    }
  });

  return menuTree;
};

export default arrayToTree;

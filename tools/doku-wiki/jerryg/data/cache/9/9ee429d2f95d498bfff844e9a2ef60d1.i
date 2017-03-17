a:6:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:6:"plugin";i:1;a:4:{i:0;s:8:"graphviz";i:1;a:6:{s:5:"width";s:3:"800";s:6:"height";s:3:"400";s:6:"layout";s:3:"dot";s:5:"align";s:5:"right";s:7:"version";s:10:"2016-02-03";s:3:"md5";s:32:"74cc667c719a3ef757aa3333b89de492";}i:2;i:5;i:3;s:810:"<graphviz dot right 800x400>
digraph ATN {
rankdir=LR;
binary_search_tree[fontsize=11, label="bst", shape=circle, fixedsize=false];
preorder [fontsize=11, label="preorder ", shape=circle, fixedsize=false];
inorder[fontsize=11, label="inorder", shape=circle, fixedsize=false];
postorder [fontsize=11, label="postorder ", shape=circle, fixedsize=false];
levelorder [fontsize=11, label="levelorder ", shape=circle, fixedsize=false];
preorder -> binary_search_tree[fontname="Times-Italic", label="explore the roots before inspecting any leaves"];
inorder-> binary_search_tree[fontname="Times-Italic", label="sort"];
postorder -> binary_search_tree[fontname="Times-Italic", label="explore all the leaves before any nodes"];
levelorder -> binary_search_tree[fontname="Times-Italic", label="&epsilon;"];
}
</graphviz>";}i:2;i:1;}i:3;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:811;}i:4;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:811;}i:5;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:811;}}
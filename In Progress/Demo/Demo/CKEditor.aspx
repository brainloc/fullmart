﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CKEditor.aspx.cs" Inherits="Demo.CKEditor" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>API Usage &mdash; CKEditor Sample</title>
    <meta content="text/html; charset=utf-8" http-equiv="content-type" />
    <script type="text/javascript" src="ckeditor/ckeditor.js"></script>
    <script src="ckeditor/general.js" type="text/javascript"></script>
    <script src="Scripts/jquery-1.4.1.js" type="text/javascript"></script>
    <link href="ckeditor/general.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
	//<![CDATA[

        // The instanceReady event is fired, when an instance of CKEditor has finished
        // its initialization.
        CKEDITOR.on('instanceReady', function (ev) {
            // Show the editor name and description in the browser status bar.
            document.getElementById('eMessage').innerHTML = '<p>Instance <code>' + ev.editor.name + '<\/code> loaded.<\/p>';

            // Show this sample buttons.
            document.getElementById('eButtons').style.display = 'block';
        });

        function InsertHTML() {
            // Get the editor instance that we want to interact with.
            var oEditor = CKEDITOR.instances.editor1;
            var value = document.getElementById('htmlArea').value;

            // Check the active editing mode.
            if (oEditor.mode == 'wysiwyg') {
                // Insert HTML code.
                // http://docs.cksource.com/ckeditor_api/symbols/CKEDITOR.editor.html#insertHtml
                oEditor.insertHtml(value);
            }
            else
                alert('You must be in WYSIWYG mode!');
        }

        function InsertText() {
            // Get the editor instance that we want to interact with.
            var oEditor = CKEDITOR.instances.editor1;
            var value = document.getElementById('txtArea').value;

            // Check the active editing mode.
            if (oEditor.mode == 'wysiwyg') {
                // Insert as plain text.
                // http://docs.cksource.com/ckeditor_api/symbols/CKEDITOR.editor.html#insertText
                oEditor.insertText(value);
            }
            else
                alert('You must be in WYSIWYG mode!');
        }

        function SetContents() {
            // Get the editor instance that we want to interact with.
            var oEditor = CKEDITOR.instances.editor1;
            var value = document.getElementById('htmlArea').value;

            // Set editor contents (replace current contents).
            // http://docs.cksource.com/ckeditor_api/symbols/CKEDITOR.editor.html#setData
            oEditor.setData(value);
        }

        function GetContents() {
            // Get the editor instance that you want to interact with.
            var oEditor = CKEDITOR.instances.editor1;

            // Get editor contents
            // http://docs.cksource.com/ckeditor_api/symbols/CKEDITOR.editor.html#getData
            alert(oEditor.getData());
        }

        function PostContents() {
            var oEditor = CKEDITOR.instances.editor1;
            var ProductID = "1";
            var Content = oEditor.getData();
            alert(Content);
            $.ajax({
                url: "CKEditor.ashx?",
                type: "POST",
                dataType: "script",
                data: {
                    ProductID: ProductID,
                    Content: Content
                }
            });
        }

        function ExecuteCommand(commandName) {
            // Get the editor instance that we want to interact with.
            var oEditor = CKEDITOR.instances.editor1;

            // Check the active editing mode.
            if (oEditor.mode == 'wysiwyg') {
                // Execute the command.
                // http://docs.cksource.com/ckeditor_api/symbols/CKEDITOR.editor.html#execCommand
                oEditor.execCommand(commandName);
            }
            else
                alert('You must be in WYSIWYG mode!');
        }

        function CheckDirty() {
            // Get the editor instance that we want to interact with.
            var oEditor = CKEDITOR.instances.editor1;
            // Checks whether the current editor contents present changes when compared
            // to the contents loaded into the editor at startup
            // http://docs.cksource.com/ckeditor_api/symbols/CKEDITOR.editor.html#checkDirty
            alert(oEditor.checkDirty());
        }

        function ResetDirty() {
            // Get the editor instance that we want to interact with.
            var oEditor = CKEDITOR.instances.editor1;
            // Resets the "dirty state" of the editor (see CheckDirty())
            // http://docs.cksource.com/ckeditor_api/symbols/CKEDITOR.editor.html#resetDirty
            oEditor.resetDirty();
            alert('The "IsDirty" status has been reset');
        }

	//]]>
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1 class="samples">
            CKEditor Sample &mdash; Using CKEditor JavaScript API
        </h1>
        <div class="description">
            <p>
                This sample shows how to use the <a class="samples" href="http://docs.cksource.com/ckeditor_api/symbols/CKEDITOR.editor.html">
                    CKEditor JavaScript API</a> to interact with the editor at runtime.
            </p>
            <p>
                For details on how to create this setup check the source code of this sample page.
            </p>
        </div>
        <!-- This <div> holds alert messages to be display in the sample page. -->
        <div id="alerts">
            <noscript>
                <p>
                    <strong>CKEditor requires JavaScript to run</strong>. In a browser with no JavaScript
                    support, like yours, you should still see the contents (HTML data) and you should
                    be able to edit it normally, without a rich editor interface.
                </p>
            </noscript>
        </div>
        <div>
            <textarea cols="200" id="editor1" name="editor1" rows="10">&lt;p&gt;This is some &lt;strong&gt;sample text&lt;/strong&gt;. You are using &lt;a href="http://ckeditor.com/"&gt;CKEditor&lt;/a&gt;.&lt;/p&gt;</textarea>
            <script type="text/javascript">
		//<![CDATA[
                // Replace the <textarea id="editor1"> with an CKEditor instance.
                var editor = CKEDITOR.replace('editor1');
		//]]>
            </script>
            <div id="eMessage">
            </div>
            <div id="eButtons" style="display: none">
                <input onclick="InsertHTML();" type="button" value="Insert HTML" />
                <input onclick="SetContents();" type="button" value="Set Editor Contents" />
                <input onclick="GetContents();" type="button" value="Get Editor Contents (XHTML)" />
                <br />
                <br />
                <input onclick="PostContents();" type="button" value="Post Editor Contents (XHTML)" />
                <br />
                <br />
                <textarea cols="100" id="htmlArea" rows="3">&lt;h2&gt;Test&lt;/h2&gt;&lt;p&gt;This is some &lt;a href="/Test1.html"&gt;sample&lt;/a&gt; HTML code.&lt;/p&gt;</textarea>
                <br />
                <br />
                <input onclick="InsertText();" type="button" value="Insert Text" />
                <br />
                <textarea cols="100" id="txtArea" rows="3">   First line with some leading whitespaces.

Second line of text preceded by two line breaks.</textarea>
                <br />
                <input onclick="ExecuteCommand('bold');" type="button" value="Execute &quot;bold&quot; Command" />
                <input onclick="ExecuteCommand('link');" type="button" value="Execute &quot;link&quot; Command" />
                <br />
                <br />
                <input onclick="CheckDirty();" type="button" value="checkDirty()" />
                <input onclick="ResetDirty();" type="button" value="resetDirty()" />
            </div>
        </div>
    </div>
    </form>
</body>
</html>

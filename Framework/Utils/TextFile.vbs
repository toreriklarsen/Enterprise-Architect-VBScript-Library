'[path=\Framework\Utils]
'[group=Utils]
'Author: Geert Bellekens
'Date: 2015-12-07

Class TextFile
	Private m_FullPath
	Private m_Contents
	Private m_Folder
	Private m_FileName

	Private Sub Class_Initialize
	  m_Folder = ""
	  m_FileName = ""
	  m_Contents = ""
	End Sub
	
	' FullPath property.
	Public Property Get FullPath
	  FullPath = me.Folder & "\" & me.FileName
	End Property
		
	' Contents property.
	Public Property Get Contents
	  Contents = m_Contents
	End Property
	Public Property Let Contents(value)
	  m_Contents = value
	End Property
	
	' FileName property.
	Public Property Get FileName
	  FileName = m_FileName
	End Property
	Public Property Let FileName(value)
	  m_FileName = value
	End Property
	
	' Folder property.
	Public Property Get Folder
	  Folder = m_Folder
	End Property
	Public Property Let Folder(value)
	  m_Folder = value
	End Property
	

	sub Save
		Dim fso, MyFile
		Set fso = CreateObject("Scripting.FileSystemObject")
		'first make sure the directory exists
		CreateFolderTree me.Folder
		'then create file
		Set MyFile = fso.CreateTextFile(me.FullPath, True)
		MyFile.Write(Contents)
		MyFile.close
	end sub
	
	private sub CreateFolderTree(path)
		Dim fso
		Set fso = CreateObject("Scripting.FileSystemObject")
		'first check if the path doesn't exist yet
		if not fso.FolderExists(path) and len(path) > 1 then
			CreateFolderTree fso.GetParentFolderName(path)
			fso.CreateFolder path
		end if
	end sub
	
end class
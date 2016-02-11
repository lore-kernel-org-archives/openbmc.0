Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 0E25E1A004D
 for <openbmc@lists.ozlabs.org>; Fri, 12 Feb 2016 09:39:50 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@bajor.fuzziesquirrel.com
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_0DBAD4A7-ADDA-4F80-9941-E7FBB62A2C30"
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
Subject: Re: [PATCH phosphor-networkd] Validating user & group names prior to
 system call and wait() on proc spawned with pexpect.
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <87egcioppp.fsf@linux.vnet.ibm.com>
Date: Thu, 11 Feb 2016 17:39:46 -0500
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>,
 openbmc@lists.ozlabs.org
Message-Id: <754A40FE-3C77-4D68-B0CF-D6877D306613@fuzziesquirrel.com>
References: <1455224447-11108-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1455224447-11108-2-git-send-email-openbmc-patches@stwcx.xyz>
 <87egcioppp.fsf@linux.vnet.ibm.com>
To: Stewart Smith <stewart@linux.vnet.ibm.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Feb 2016 22:39:51 -0000


--Apple-Mail=_0DBAD4A7-ADDA-4F80-9941-E7FBB62A2C30
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Sorry about the dup Stewart=E2=80=A6

grp just parses the file and returns a dictionary.  It doesn=E2=80=99t =
do anything mutable.

The only thing I could find was libuser=E2=80=A6.

-brad

> On Feb 11, 2016, at 5:18 PM, Stewart Smith =
<stewart@linux.vnet.ibm.com> wrote:
>=20
> OpenBMC Patches <openbmc-patches@stwcx.xyz =
<mailto:openbmc-patches@stwcx.xyz>> writes:
>> From: Hariharasubramanian R <hramasub@in.ibm.com>
>>=20
>> ---
>> userman.py | 106 =
++++++++++++++++++++++++++++++++++++++++++++-----------------
>> 1 file changed, 76 insertions(+), 30 deletions(-)
>>=20
>> diff --git a/userman.py b/userman.py
>> index 6109582..033d3d1 100755
>> --- a/userman.py
>> +++ b/userman.py
>> @@ -25,7 +25,8 @@ OBJ_NAME_USER =3D '/org/openbmc/UserManager/User'
>>     Object Path > /org/openbmc/UserManager/Groups
>>         Interface:Method > org.openbmc.Enrol.GroupAddSys =
string:"groupname"
>>         Interface:Method > org.openbmc.Enrol.GroupAddUsr =
string:"groupname"
>> -        Interface:Method > org.openbmc.Enrol.GroupList
>> +        Interface:Method > org.openbmc.Enrol.GroupListUsr
>> +        Interface:Method > org.openbmc.Enrol.GroupListSys
>>     Object Path > /org/openbmc/UserManager/Group
>>         Interface:Method > org.openbmc.Enrol.GroupDel =
string:"groupname"
>>     Object Path > /org/openbmc/UserManager/Users
>> @@ -60,16 +61,26 @@ class UserManGroups (dbus.service.Object):
>>=20
>>     @dbus.service.method(INTF_NAME, "s", "x")
>>     def GroupAddUsr (self, groupname):
>> +        if not groupname : return 1
>> +
>> +        groups =3D self.GroupListAll ()
>> +        if groupname in groups: return 1
>> +
>>         r =3D call (["addgroup", groupname])
>>         return r
>>=20
>>     @dbus.service.method(INTF_NAME, "s", "x")
>>     def GroupAddSys (self, groupname):
>> +        if not groupname : return 1
>> +
>> +        groups =3D self.GroupListAll ()
>> +        if groupname in groups: return 1
>> +
>>         r =3D call (["addgroup", "-S", groupname])
>>         return 0
>>=20
>>     @dbus.service.method(INTF_NAME, "", "as")
>> -    def GroupList (self):
>> +    def GroupListUsr (self):
>>         groupList =3D []
>>         with open("/etc/group", "r") as f:
>>             for grent in f:
>> @@ -78,6 +89,23 @@ class UserManGroups (dbus.service.Object):
>>                     groupList.append(groupParams[0])
>>         return groupList
>>=20
>> +    @dbus.service.method(INTF_NAME, "", "as")
>> +    def GroupListSys (self):
>> +        groupList =3D []
>> +        with open("/etc/group", "r") as f:
>> +            for grent in f:
>> +                groupParams =3D grent.split (":")
>> +                if (int(groupParams[2]) > 100 and =
int(groupParams[2]) < 1000): groupList.append(groupParams[0])
>> +        return groupList
>=20
> Why aren't you using an existing python module such as grp rather than
> writing your own (likely buggy) parser?
>=20
> It seems to have existed since at least python 2.6...
> https://docs.python.org/2.6/library/grp.html =
<https://docs.python.org/2.6/library/grp.html>
>=20
>> @@ -111,39 +144,31 @@ class UserManUsers (dbus.service.Object):
>>=20
>>     @dbus.service.method(INTF_NAME, "ssss", "x")
>>     def UserAdd (self, gecos, username, groupname, passwd):
>> +        if not username: return 1
>> +
>> +        users =3D self.UserList ()
>> +        if username in users : return 1
>> +
>>         if groupname:
>> -            cmd =3D "adduser "  + " -g "  + gecos + " -G ", =
groupname + " " + username
>> +            groups =3D Groupsobj.GroupListAll ()
>> +            if groupname not in groups: return 1
>> +
>> +        opts =3D ""
>> +        if gecos: opts =3D " -g " + '"' + gecos + '"'
>> +
>> +        if groupname:
>> +            cmd =3D "adduser "  + opts + " " + " -G " + groupname + =
" " + username
>>         else:
>> -            cmd =3D "adduser "  + " -g "  + gecos + username
>> +            cmd =3D "adduser "  + opts + " " + username
>=20
> I note there's a python-libuser package on ubuntu, is that a library
> that could be used instead?
>=20
> --=20
> Stewart Smith
> OPAL Architect, IBM.
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org <mailto:openbmc@lists.ozlabs.org>
> https://lists.ozlabs.org/listinfo/openbmc =
<https://lists.ozlabs.org/listinfo/openbmc>

--Apple-Mail=_0DBAD4A7-ADDA-4F80-9941-E7FBB62A2C30
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><div class=3D"">Sorry about the dup Stewart=E2=80=A6</div><div =
class=3D""><br class=3D""></div><div class=3D""><div class=3D"">grp just =
parses the file and returns a dictionary. &nbsp;It doesn=E2=80=99t do =
anything mutable.</div><div class=3D""><br class=3D""></div><div =
class=3D"">The only thing I could find was libuser=E2=80=A6.</div><div =
class=3D""><br class=3D""></div><div class=3D"">-brad</div></div><br =
class=3D""><div><blockquote type=3D"cite" class=3D""><div class=3D"">On =
Feb 11, 2016, at 5:18 PM, Stewart Smith &lt;<a =
href=3D"mailto:stewart@linux.vnet.ibm.com" =
class=3D"">stewart@linux.vnet.ibm.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><span =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">OpenBMC Patches &lt;</span><a =
href=3D"mailto:openbmc-patches@stwcx.xyz" style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D"">openbmc-patches@stwcx.xyz</a><span style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; float: =
none; display: inline !important;" class=3D"">&gt; writes:</span><br =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D"">From: Hariharasubramanian R =
&lt;<a href=3D"mailto:hramasub@in.ibm.com" =
class=3D"">hramasub@in.ibm.com</a>&gt;<br class=3D""><br class=3D"">---<br=
 class=3D"">userman.py | 106 =
++++++++++++++++++++++++++++++++++++++++++++-----------------<br =
class=3D"">1 file changed, 76 insertions(+), 30 deletions(-)<br =
class=3D""><br class=3D"">diff --git a/userman.py b/userman.py<br =
class=3D"">index 6109582..033d3d1 100755<br class=3D"">--- =
a/userman.py<br class=3D"">+++ b/userman.py<br class=3D"">@@ -25,7 +25,8 =
@@ OBJ_NAME_USER =3D '/org/openbmc/UserManager/User'<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;Object Path &gt; =
/org/openbmc/UserManager/Groups<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Interface:Metho=
d &gt; org.openbmc.Enrol.GroupAddSys string:"groupname"<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Interface:Metho=
d &gt; org.openbmc.Enrol.GroupAddUsr string:"groupname"<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Interface:Method &gt; =
org.openbmc.Enrol.GroupList<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Interface:Method &gt; =
org.openbmc.Enrol.GroupListUsr<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Interface:Method &gt; =
org.openbmc.Enrol.GroupListSys<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;Object Path &gt; =
/org/openbmc/UserManager/Group<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Interface:Metho=
d &gt; org.openbmc.Enrol.GroupDel string:"groupname"<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;Object Path &gt; =
/org/openbmc/UserManager/Users<br class=3D"">@@ -60,16 +61,26 @@ class =
UserManGroups (dbus.service.Object):<br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;@dbus.service.method(INTF_NAME, "s", =
"x")<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;def GroupAddUsr (self, =
groupname):<br class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if =
not groupname : return 1<br class=3D"">+<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;groups =3D self.GroupListAll =
()<br class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if =
groupname in groups: return 1<br class=3D"">+<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;r =3D call =
(["addgroup", groupname])<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return r<br =
class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;@dbus.service.method(INTF_NAME, "s", =
"x")<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;def GroupAddSys (self, =
groupname):<br class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if =
not groupname : return 1<br class=3D"">+<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;groups =3D self.GroupListAll =
()<br class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if =
groupname in groups: return 1<br class=3D"">+<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;r =3D call =
(["addgroup", "-S", groupname])<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return 0<br =
class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;@dbus.service.method(INTF_NAME, "", =
"as")<br class=3D"">- &nbsp;&nbsp;&nbsp;def GroupList (self):<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;def GroupListUsr (self):<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;groupList =3D =
[]<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;with =
open("/etc/group", "r") as f:<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;for grent in f:<br class=3D"">@@ -78,6 +89,23 @@ class =
UserManGroups (dbus.service.Object):<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;groupList.append(=
groupParams[0])<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return =
groupList<br class=3D""><br class=3D"">+ =
&nbsp;&nbsp;&nbsp;@dbus.service.method(INTF_NAME, "", "as")<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;def GroupListSys (self):<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;groupList =3D []<br class=3D"">+=
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;with open("/etc/group", "r") =
as f:<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;for =
grent in f:<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;groupParams =3D grent.split (":")<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;if (int(groupParams[2]) &gt; 100 and int(groupParams[2]) =
&lt; 1000): groupList.append(groupParams[0])<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return groupList<br =
class=3D""></blockquote><br style=3D"font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><span =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">Why aren't you using an existing python module =
such as grp rather than</span><br style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant: normal; font-weight: =
normal; letter-spacing: normal; orphans: auto; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; widows: =
auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><span=
 style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">writing your own (likely buggy) =
parser?</span><br style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><br =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><span style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; float: =
none; display: inline !important;" class=3D"">It seems to have existed =
since at least python 2.6...</span><br style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant: normal; font-weight: =
normal; letter-spacing: normal; orphans: auto; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; widows: =
auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><a =
href=3D"https://docs.python.org/2.6/library/grp.html" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" =
class=3D"">https://docs.python.org/2.6/library/grp.html</a><br =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><br style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><blockquote type=3D"cite" style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant: normal; font-weight: =
normal; letter-spacing: normal; orphans: auto; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; widows: =
auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D"">@@ =
-111,39 +144,31 @@ class UserManUsers (dbus.service.Object):<br =
class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;@dbus.service.method(INTF_NAME, =
"ssss", "x")<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;def UserAdd (self, =
gecos, username, groupname, passwd):<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if not username: return 1<br =
class=3D"">+<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;users =3D self.UserList ()<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if username in =
users : return 1<br class=3D"">+<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if =
groupname:<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cmd =3D =
"adduser " &nbsp;+ " -g " &nbsp;+ gecos + " -G ", groupname + " " + =
username<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;groups =
=3D Groupsobj.GroupListAll ()<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if =
groupname not in groups: return 1<br class=3D"">+<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;opts =3D ""<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if gecos: opts =3D " -g " + =
'"' + gecos + '"'<br class=3D"">+<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if groupname:<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cmd =3D =
"adduser " &nbsp;+ opts + " " + " -G " + groupname + " " + username<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;else:<br =
class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cmd =3D =
"adduser " &nbsp;+ " -g " &nbsp;+ gecos + username<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cmd =3D =
"adduser " &nbsp;+ opts + " " + username<br class=3D""></blockquote><br =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><span style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; float: =
none; display: inline !important;" class=3D"">I note there's a =
python-libuser package on ubuntu, is that a library</span><br =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><span style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; float: =
none; display: inline !important;" class=3D"">that could be used =
instead?</span><br style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><br =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><span style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; float: =
none; display: inline !important;" class=3D"">--<span =
class=3D"Apple-converted-space">&nbsp;</span></span><br =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><span style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; float: =
none; display: inline !important;" class=3D"">Stewart Smith</span><br =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><span style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; float: =
none; display: inline !important;" class=3D"">OPAL Architect, =
IBM.</span><br style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><br =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><span style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; float: =
none; display: inline !important;" =
class=3D"">_______________________________________________</span><br =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><span style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; float: =
none; display: inline !important;" class=3D"">openbmc mailing =
list</span><br style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><a =
href=3D"mailto:openbmc@lists.ozlabs.org" style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D"">openbmc@lists.ozlabs.org</a><br style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><a href=3D"https://lists.ozlabs.org/listinfo/openbmc" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" =
class=3D"">https://lists.ozlabs.org/listinfo/openbmc</a></div></blockquote=
></div><br class=3D""></body></html>=

--Apple-Mail=_0DBAD4A7-ADDA-4F80-9941-E7FBB62A2C30--

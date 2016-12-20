Return-Path: <mine260309@gmail.com>
Received: from mail-qk0-x232.google.com (mail-qk0-x232.google.com
 [IPv6:2607:f8b0:400d:c09::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tjX8M1GcmzDwT7
 for <openbmc@lists.ozlabs.org>; Tue, 20 Dec 2016 20:11:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="iu+0SOJK"; 
 dkim-atps=neutral
Received: by mail-qk0-x232.google.com with SMTP id t184so41517422qkd.0
 for <openbmc@lists.ozlabs.org>; Tue, 20 Dec 2016 01:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=7Z1NJEh/shL9ZrjPttvq00T4WkKwZwdnltFhmt08M24=;
 b=iu+0SOJKVHABX8IfI7s5QCEcnOVg78I+CE3TNW3DjBhx2Ql348xn8ES9rJwVggq2Y9
 aunVm7bKiWOKe8S/YksK4ZQ/Ah44Ls3iGfoOJUOkYTueZaVBwMOAqCN/lGSBNzfJmCwp
 2od0iXekLCFWC/rEEbvd3kLghFc+SD6e7rlWrRqLW7lDxSq3LwtKjx8QvGcWWfwB3EuM
 EY+nS9Rcm2JVmPRMIpbCcwvvKHfYMd2RAAUY0xtHTqTYf4bb2A3H3FckWXAy5ndLLAOn
 RfXXVTHowrhfD5EOgFE9LYZ+8WxM9pG+1IoIUA2zgyId8fpHUFO2n072cp0bFr7Z+LvF
 oIKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=7Z1NJEh/shL9ZrjPttvq00T4WkKwZwdnltFhmt08M24=;
 b=TxlsDZLrFzNBqm9SLBpflMrLBZI4N8vu8kK2v731c23c/ltIzjf8slXgI/d75LDQe+
 vGjwT4mQpzSkwx0xzKSiE1zvthEzk/5iZZCVif6bn51EipvvUzAMDE9i/OyCWaRuvBP9
 Ggn51R9rp+hMaNB/uJ4TbNeCq+bhjtAY3mi3WGzmOfRCjZY278tKTKnHdBPyqc2G10N3
 jJQJsM6YplYBXr2s9dSqXBRBLaO7sAYLx2l1e/flFAatf645vPDPnHiIvtDfQJaWJ74C
 sHLI17ii+OhoIG7cDLnMg7dMscmNjHYvTG2EdvONd1WkFdY5m3iLUgoq2mmcB+A4vJlR
 JKLg==
X-Gm-Message-State: AIkVDXK2l0JneO8R8+ciUc1TpYJ+kpzMKIApkiOM+skRPnmdm1W0pZ4Eb+QqonT2ZU2hoMTsmEPGuZHviqqXUQ==
X-Received: by 10.55.76.197 with SMTP id z188mr3563974qka.184.1482225072659;
 Tue, 20 Dec 2016 01:11:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.172.204 with HTTP; Tue, 20 Dec 2016 01:11:12 -0800 (PST)
From: Mine <mine260309@gmail.com>
Date: Tue, 20 Dec 2016 17:11:12 +0800
Message-ID: <CAARXrtnAQEo_Gt8D+abpHYCKb4O3z2FxmsCJWbVXH=TnXdCD+w@mail.gmail.com>
Subject: Introduce yet another C++ naming style
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a114a8062eee4770544136a8b
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Dec 2016 09:11:16 -0000

--001a114a8062eee4770544136a8b
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi All,

This email is to introduce a naming style I used in previous project, which
I think is elegant and makes the code more friendly to read.
I just want to share this style for discussion and if you think it=E2=80=99=
s
better, we may use this style in OpenBMC projects.

In recent reviews I see some comments about the problems and debate on C++
class=E2=80=99s members and function parameters.

E.g.

   1. In generated sdbusplus code, we may happen to use C++=E2=80=99s keywo=
rds as
   class members, such as server::Delete::delete. This is address by
   https://gerrit.openbmc-project.xyz/#/c/1481/
   2. Sometimes we use the same name for a class=E2=80=99s member and funct=
ion
   parameter, such as:

   class Host {
     sdbusplus::bus::bus& bus;
     Host(sdbusplus::bus::bus& bus, ...)
      : bus(bus)
     {...}
   };

   This is OK, but some reviewers/readers may feel a bit strange on the
   code.
   Some one prefer underscores like _bus to resolve this issue, some other
   may feel bus is just good.
   3. We may want to define a object with the same name as class=E2=80=99s =
name,
   such as:

   class foo {
     ...
   };//foo foo; // This does not compile
   foo myFoo; // We'll have to use a different name

   4. During reading the code, sometimes it=E2=80=99s hard to find if a var=
iable is
   a local varialbe, or the class=E2=80=99s member, or a constant, such as:

   class Host {
    std::string somePath;
   };
   ...const char* constPath =3D "xxx";
   Host::xxx(const char* anotherPath) {
    std::string theThirdPath;
    // In this function, how do we tell if xxxPath is a local variable
or class's member?
   }


The naming style I introduce will address all these =E2=80=9Cproblems=E2=80=
=9D.

   1. All classes, structs, enums start with =E2=80=9CT=E2=80=9D, e.g. TUpp=
erCamelCase
   2. All interfaces (with pure virtual functions) starts with =E2=80=9CI=
=E2=80=9D, e.g.
   IUpperCamelCase
   3. All members and functions of a class use UpperCamelCase
   4. All function parameters and local variables uses lowerCamelCase
   5. All const or constexpr uses ALL_UPPER_CASE, the same for enum=E2=80=
=99s
   values.

*Note:* All these styles apply to application code, if the code is to
provide a library like STL, keep STL style.

With the above styles, we can see all the above =E2=80=9Cproblems=E2=80=9D =
are resolved:

   1. Because class members are in UpperCamelCase, so it will not use C++=
=E2=80=99s
   reserved keywords at all;
   2. Because classes are in TUpperCamelCase, and parameters are in
   lowerCamelCase, we won=E2=80=99t have same names for class members and f=
unction
   parameters

   class THost {
    sdbusplus::bus::bus& Bus;
    THost(sdbusplus::bus::bus& bus, ...)
     : Bus(bus)
    {...}
   };

   3. Because classes are in TUpperCamelCase, we can always define a
   variable/member with the name we like:

   class TFoo {
     ...
   };
   TFoo Foo; // OK for class member
   TFoo foo; // OK for local variables

   4. We can always tell if a variable is a class=E2=80=99s member, or a lo=
cal
   variable, or constants, or a function call.

   class THost {
     std::string SomePath;
     enum class TValue {
       ONE,
       TWO,
       THREE
     };
   };
   ...const char* CONST_PATH =3D "xxx";
   THost::xxx(const char* anotherPath, TFoo* foo) {
     std::string theThirdPath;
     foo->InvokeMethod();
     // By reading the code (even with header file), we know:
     //
     // "SomePath" is class's member as THost::SomePath
     // "CONST_PATH" and "ONE/TWO/THREE" are constants
     // *anotherPath* and *theThirdPath* are local variables
     // "foo->InvokeMethod()" is to call TFoo::InvokeMethod() function
   }


I think this style is simple and effective, and it improves readability.
What do you think?

=E2=80=94
BRs,
Lei YU
=E2=80=8B

--001a114a8062eee4770544136a8b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div style=3D"" class=3D"markdown-here-wrapper"><p style=
=3D"margin:0px 0px 1.2em!important">Hi All,</p>
<p style=3D"margin:0px 0px 1.2em!important">This email is to introduce a na=
ming style I  used in previous project, which I think is elegant and makes =
the code  more friendly to read.<br>I just want to share this style for dis=
cussion and if you think it=E2=80=99s better, we may use this style in Open=
BMC projects.</p>
<p style=3D"margin:0px 0px 1.2em!important">In recent reviews I see some co=
mments about the problems and debate on C++ class=E2=80=99s members and fun=
ction parameters.</p>
<p style=3D"margin:0px 0px 1.2em!important">E.g.</p>
<ol style=3D"margin:1.2em 0px;padding-left:2em">
<li style=3D"margin:0.5em 0px">In generated sdbusplus code, we may happen t=
o use C++=E2=80=99s keywords as  class members, such as <code style=3D"font=
-size:0.85em;font-family:Consolas,Inconsolata,Courier,monospace;margin:0px =
0.15em;padding:0px 0.3em;white-space:pre-wrap;border:1px solid rgb(234,234,=
234);background-color:rgb(248,248,248);border-radius:3px;display:inline">se=
rver::Delete::delete</code>. This is address by  <a href=3D"https://gerrit.=
openbmc-project.xyz/#/c/1481/">https://gerrit.openbmc-project.xyz/#/c/1481/=
</a></li>
<li style=3D"margin:0.5em 0px">Sometimes we use the same name for a class=
=E2=80=99s member and function parameter, such as:<pre style=3D"font-size:0=
.85em;font-family:Consolas,Inconsolata,Courier,monospace;font-size:1em;line=
-height:1.2em;margin:1.2em 0px"><code style=3D"font-size:0.85em;font-family=
:Consolas,Inconsolata,Courier,monospace;margin:0px 0.15em;padding:0px 0.3em=
;white-space:pre-wrap;border:1px solid rgb(234,234,234);background-color:rg=
b(248,248,248);border-radius:3px;display:inline;white-space:pre;overflow:au=
to;border-radius:3px;border:1px solid rgb(204,204,204);padding:0.5em 0.7em;=
display:block!important;display:block;overflow-x:auto;padding:0.5em;color:r=
gb(51,51,51);background:rgb(248,248,248) none repeat scroll 0% 0%" class=3D=
"hljs language-c++"><span style=3D"color:rgb(51,51,51);font-weight:bold" cl=
ass=3D"hljs-keyword">class</span> Host {
  sdbusplus::bus::bus&amp; bus;
  Host(sdbusplus::bus::bus&amp; bus, ...)
   : bus(bus)
  {...}
};
</code></pre>
This is OK, but some reviewers/readers may feel a bit strange on the code.<=
br>Some one prefer underscores like <code style=3D"font-size:0.85em;font-fa=
mily:Consolas,Inconsolata,Courier,monospace;margin:0px 0.15em;padding:0px 0=
.3em;white-space:pre-wrap;border:1px solid rgb(234,234,234);background-colo=
r:rgb(248,248,248);border-radius:3px;display:inline">_bus</code> to resolve=
 this issue, some other may feel <code style=3D"font-size:0.85em;font-famil=
y:Consolas,Inconsolata,Courier,monospace;margin:0px 0.15em;padding:0px 0.3e=
m;white-space:pre-wrap;border:1px solid rgb(234,234,234);background-color:r=
gb(248,248,248);border-radius:3px;display:inline">bus</code> is just good.<=
/li>
<li style=3D"margin:0.5em 0px">We may want to define a object with the same=
 name as class=E2=80=99s name, such as:<pre style=3D"font-size:0.85em;font-=
family:Consolas,Inconsolata,Courier,monospace;font-size:1em;line-height:1.2=
em;margin:1.2em 0px"><code style=3D"font-size:0.85em;font-family:Consolas,I=
nconsolata,Courier,monospace;margin:0px 0.15em;padding:0px 0.3em;white-spac=
e:pre-wrap;border:1px solid rgb(234,234,234);background-color:rgb(248,248,2=
48);border-radius:3px;display:inline;white-space:pre;overflow:auto;border-r=
adius:3px;border:1px solid rgb(204,204,204);padding:0.5em 0.7em;display:blo=
ck!important;display:block;overflow-x:auto;padding:0.5em;color:rgb(51,51,51=
);background:rgb(248,248,248) none repeat scroll 0% 0%" class=3D"hljs langu=
age-c++"><span style=3D"color:rgb(51,51,51);font-weight:bold" class=3D"hljs=
-keyword">class</span> foo {
  ...
};
<span style=3D"color:rgb(153,153,136);font-style:italic" class=3D"hljs-comm=
ent">//foo foo; // This does not compile</span>
foo myFoo; <span style=3D"color:rgb(153,153,136);font-style:italic" class=
=3D"hljs-comment">// We&#39;ll have to use a different name</span>
</code></pre>
</li>
<li style=3D"margin:0.5em 0px">During reading the code, sometimes it=E2=80=
=99s hard to find if a variable is a  local varialbe, or the class=E2=80=99=
s member, or a constant, such as:<pre style=3D"font-size:0.85em;font-family=
:Consolas,Inconsolata,Courier,monospace;font-size:1em;line-height:1.2em;mar=
gin:1.2em 0px"><code style=3D"font-size:0.85em;font-family:Consolas,Inconso=
lata,Courier,monospace;margin:0px 0.15em;padding:0px 0.3em;white-space:pre-=
wrap;border:1px solid rgb(234,234,234);background-color:rgb(248,248,248);bo=
rder-radius:3px;display:inline;white-space:pre;overflow:auto;border-radius:=
3px;border:1px solid rgb(204,204,204);padding:0.5em 0.7em;display:block!imp=
ortant;display:block;overflow-x:auto;padding:0.5em;color:rgb(51,51,51);back=
ground:rgb(248,248,248) none repeat scroll 0% 0%" class=3D"hljs language-c+=
+"><span style=3D"color:rgb(51,51,51);font-weight:bold" class=3D"hljs-keywo=
rd">class</span> Host {
 std::<span style=3D"color:rgb(0,134,179)" class=3D"hljs-built_in">string</=
span> somePath;
};
...
<span style=3D"color:rgb(51,51,51);font-weight:bold" class=3D"hljs-keyword"=
>const</span> <span style=3D"color:rgb(51,51,51);font-weight:bold" class=3D=
"hljs-keyword">char</span>* constPath =3D <span style=3D"color:rgb(221,17,6=
8)" class=3D"hljs-string">&quot;xxx&quot;</span>;
Host::xxx(<span style=3D"color:rgb(51,51,51);font-weight:bold" class=3D"hlj=
s-keyword">const</span> <span style=3D"color:rgb(51,51,51);font-weight:bold=
" class=3D"hljs-keyword">char</span>* anotherPath) {
 std::<span style=3D"color:rgb(0,134,179)" class=3D"hljs-built_in">string</=
span> theThirdPath;
 <span style=3D"color:rgb(153,153,136);font-style:italic" class=3D"hljs-com=
ment">// In this function, how do we tell if xxxPath is a local variable or=
 class&#39;s member?</span>
}
</code></pre>
</li>
</ol>
<p style=3D"margin:0px 0px 1.2em!important">The naming style I introduce wi=
ll address all these =E2=80=9Cproblems=E2=80=9D.</p>
<ol style=3D"margin:1.2em 0px;padding-left:2em">
<li style=3D"margin:0.5em 0px">All classes, structs, enums start with =E2=
=80=9CT=E2=80=9D, e.g. <code style=3D"font-size:0.85em;font-family:Consolas=
,Inconsolata,Courier,monospace;margin:0px 0.15em;padding:0px 0.3em;white-sp=
ace:pre-wrap;border:1px solid rgb(234,234,234);background-color:rgb(248,248=
,248);border-radius:3px;display:inline">TUpperCamelCase</code></li>
<li style=3D"margin:0.5em 0px">All interfaces (with pure virtual functions)=
 starts with =E2=80=9CI=E2=80=9D, e.g. <code style=3D"font-size:0.85em;font=
-family:Consolas,Inconsolata,Courier,monospace;margin:0px 0.15em;padding:0p=
x 0.3em;white-space:pre-wrap;border:1px solid rgb(234,234,234);background-c=
olor:rgb(248,248,248);border-radius:3px;display:inline">IUpperCamelCase</co=
de></li>
<li style=3D"margin:0.5em 0px">All members and functions of a class use <co=
de style=3D"font-size:0.85em;font-family:Consolas,Inconsolata,Courier,monos=
pace;margin:0px 0.15em;padding:0px 0.3em;white-space:pre-wrap;border:1px so=
lid rgb(234,234,234);background-color:rgb(248,248,248);border-radius:3px;di=
splay:inline">UpperCamelCase</code></li>
<li style=3D"margin:0.5em 0px">All function parameters and local variables =
uses <code style=3D"font-size:0.85em;font-family:Consolas,Inconsolata,Couri=
er,monospace;margin:0px 0.15em;padding:0px 0.3em;white-space:pre-wrap;borde=
r:1px solid rgb(234,234,234);background-color:rgb(248,248,248);border-radiu=
s:3px;display:inline">lowerCamelCase</code></li>
<li style=3D"margin:0.5em 0px">All const or constexpr uses <code style=3D"f=
ont-size:0.85em;font-family:Consolas,Inconsolata,Courier,monospace;margin:0=
px 0.15em;padding:0px 0.3em;white-space:pre-wrap;border:1px solid rgb(234,2=
34,234);background-color:rgb(248,248,248);border-radius:3px;display:inline"=
>ALL_UPPER_CASE</code>, the same for enum=E2=80=99s values.</li>
</ol>
<p style=3D"margin:0px 0px 1.2em!important"><strong>Note:</strong> All thes=
e styles apply to application code, if the code is to provide a library lik=
e STL, keep STL style.</p>
<p style=3D"margin:0px 0px 1.2em!important">With the above styles, we can s=
ee all the above =E2=80=9Cproblems=E2=80=9D are resolved:</p>
<ol style=3D"margin:1.2em 0px;padding-left:2em">
<li style=3D"margin:0.5em 0px">Because class members are in <code style=3D"=
font-size:0.85em;font-family:Consolas,Inconsolata,Courier,monospace;margin:=
0px 0.15em;padding:0px 0.3em;white-space:pre-wrap;border:1px solid rgb(234,=
234,234);background-color:rgb(248,248,248);border-radius:3px;display:inline=
">UpperCamelCase</code>, so it will not use C++=E2=80=99s reserved keywords=
 at all;</li>
<li style=3D"margin:0.5em 0px">Because classes are in <code style=3D"font-s=
ize:0.85em;font-family:Consolas,Inconsolata,Courier,monospace;margin:0px 0.=
15em;padding:0px 0.3em;white-space:pre-wrap;border:1px solid rgb(234,234,23=
4);background-color:rgb(248,248,248);border-radius:3px;display:inline">TUpp=
erCamelCase</code>, and parameters are in  <code style=3D"font-size:0.85em;=
font-family:Consolas,Inconsolata,Courier,monospace;margin:0px 0.15em;paddin=
g:0px 0.3em;white-space:pre-wrap;border:1px solid rgb(234,234,234);backgrou=
nd-color:rgb(248,248,248);border-radius:3px;display:inline">lowerCamelCase<=
/code>, we won=E2=80=99t have same names for class members and  function pa=
rameters<pre style=3D"font-size:0.85em;font-family:Consolas,Inconsolata,Cou=
rier,monospace;font-size:1em;line-height:1.2em;margin:1.2em 0px"><code styl=
e=3D"font-size:0.85em;font-family:Consolas,Inconsolata,Courier,monospace;ma=
rgin:0px 0.15em;padding:0px 0.3em;white-space:pre-wrap;border:1px solid rgb=
(234,234,234);background-color:rgb(248,248,248);border-radius:3px;display:i=
nline;white-space:pre;overflow:auto;border-radius:3px;border:1px solid rgb(=
204,204,204);padding:0.5em 0.7em;display:block!important;display:block;over=
flow-x:auto;padding:0.5em;color:rgb(51,51,51);background:rgb(248,248,248) n=
one repeat scroll 0% 0%" class=3D"hljs language-c++"><span style=3D"color:r=
gb(51,51,51);font-weight:bold" class=3D"hljs-keyword">class</span> THost {
 sdbusplus::bus::bus&amp; Bus;
 THost(sdbusplus::bus::bus&amp; bus, ...)
  : Bus(bus)
 {...}
};
</code></pre>
</li>
<li style=3D"margin:0.5em 0px">Because classes are in <code style=3D"font-s=
ize:0.85em;font-family:Consolas,Inconsolata,Courier,monospace;margin:0px 0.=
15em;padding:0px 0.3em;white-space:pre-wrap;border:1px solid rgb(234,234,23=
4);background-color:rgb(248,248,248);border-radius:3px;display:inline">TUpp=
erCamelCase</code>, we can always define a variable/member with the name we=
 like:<pre style=3D"font-size:0.85em;font-family:Consolas,Inconsolata,Couri=
er,monospace;font-size:1em;line-height:1.2em;margin:1.2em 0px"><code style=
=3D"font-size:0.85em;font-family:Consolas,Inconsolata,Courier,monospace;mar=
gin:0px 0.15em;padding:0px 0.3em;white-space:pre-wrap;border:1px solid rgb(=
234,234,234);background-color:rgb(248,248,248);border-radius:3px;display:in=
line;white-space:pre;overflow:auto;border-radius:3px;border:1px solid rgb(2=
04,204,204);padding:0.5em 0.7em;display:block!important;display:block;overf=
low-x:auto;padding:0.5em;color:rgb(51,51,51);background:rgb(248,248,248) no=
ne repeat scroll 0% 0%" class=3D"hljs language-c++"><span style=3D"color:rg=
b(51,51,51);font-weight:bold" class=3D"hljs-keyword">class</span> TFoo {
  ...
};
TFoo Foo; <span style=3D"color:rgb(153,153,136);font-style:italic" class=3D=
"hljs-comment">// OK for class member</span>
TFoo foo; <span style=3D"color:rgb(153,153,136);font-style:italic" class=3D=
"hljs-comment">// OK for local variables</span>
</code></pre>
</li>
<li style=3D"margin:0.5em 0px">We can always tell if a variable is a class=
=E2=80=99s member, or a local variable, or constants, or a function call.<p=
re style=3D"font-size:0.85em;font-family:Consolas,Inconsolata,Courier,monos=
pace;font-size:1em;line-height:1.2em;margin:1.2em 0px"><code style=3D"font-=
size:0.85em;font-family:Consolas,Inconsolata,Courier,monospace;margin:0px 0=
.15em;padding:0px 0.3em;white-space:pre-wrap;border:1px solid rgb(234,234,2=
34);background-color:rgb(248,248,248);border-radius:3px;display:inline;whit=
e-space:pre;overflow:auto;border-radius:3px;border:1px solid rgb(204,204,20=
4);padding:0.5em 0.7em;display:block!important;display:block;overflow-x:aut=
o;padding:0.5em;color:rgb(51,51,51);background:rgb(248,248,248) none repeat=
 scroll 0% 0%" class=3D"hljs language-c++"><span style=3D"color:rgb(51,51,5=
1);font-weight:bold" class=3D"hljs-keyword">class</span> THost {
  std::<span style=3D"color:rgb(0,134,179)" class=3D"hljs-built_in">string<=
/span> SomePath;
  <span style=3D"color:rgb(51,51,51);font-weight:bold" class=3D"hljs-keywor=
d">enum</span> <span style=3D"color:rgb(51,51,51);font-weight:bold" class=
=3D"hljs-keyword">class</span> TValue {
    ONE,
    TWO,
    THREE
  };
};
...
<span style=3D"color:rgb(51,51,51);font-weight:bold" class=3D"hljs-keyword"=
>const</span> <span style=3D"color:rgb(51,51,51);font-weight:bold" class=3D=
"hljs-keyword">char</span>* CONST_PATH =3D <span style=3D"color:rgb(221,17,=
68)" class=3D"hljs-string">&quot;xxx&quot;</span>;
THost::xxx(<span style=3D"color:rgb(51,51,51);font-weight:bold" class=3D"hl=
js-keyword">const</span> <span style=3D"color:rgb(51,51,51);font-weight:bol=
d" class=3D"hljs-keyword">char</span>* anotherPath, TFoo* foo) {
  std::<span style=3D"color:rgb(0,134,179)" class=3D"hljs-built_in">string<=
/span> theThirdPath;
  foo-&gt;InvokeMethod();
  <span style=3D"color:rgb(153,153,136);font-style:italic" class=3D"hljs-co=
mment">// By reading the code (even with header file), we know:</span>
  <span style=3D"color:rgb(153,153,136);font-style:italic" class=3D"hljs-co=
mment">//</span>
  <span style=3D"color:rgb(153,153,136);font-style:italic" class=3D"hljs-co=
mment">// &quot;SomePath&quot; is class&#39;s member as THost::SomePath</sp=
an>
  <span style=3D"color:rgb(153,153,136);font-style:italic" class=3D"hljs-co=
mment">// &quot;CONST_PATH&quot; and &quot;ONE/TWO/THREE&quot; are constant=
s</span>
  <span style=3D"color:rgb(153,153,136);font-style:italic" class=3D"hljs-co=
mment">// *anotherPath* and *theThirdPath* are local variables</span>
  <span style=3D"color:rgb(153,153,136);font-style:italic" class=3D"hljs-co=
mment">// &quot;foo-&gt;InvokeMethod()&quot; is to call TFoo::InvokeMethod(=
) function</span>
}
</code></pre>
</li>
</ol>
<p style=3D"margin:0px 0px 1.2em!important">I think this style is simple an=
d effective, and it improves readability.<br>What do you think?</p>
<p style=3D"margin:0px 0px 1.2em!important">=E2=80=94<br>BRs,<br>Lei YU</p>
<div title=3D"MDH:PGRpdj48ZGl2PkhpIEFsbCw8YnI+PGJyPlRoaXMgZW1haWwgaXMgdG8ga=
W50cm9kdWNlIGEgbmFt
aW5nIHN0eWxlIEkgCnVzZWQgaW4gcHJldmlvdXMgcHJvamVjdCwgd2hpY2ggSSB0aGluayBpcyB=
l
bGVnYW50IGFuZCBtYWtlcyB0aGUgY29kZSAKbW9yZSBmcmllbmRseSB0byByZWFkLjxicj5JIGp=
1
c3Qgd2FudCB0byBzaGFyZSB0aGlzIHN0eWxlIGZvciBkaXNjdXNzaW9uIGFuZCBpZiB5b3UgdGh=
p
bmsgaXQncyBiZXR0ZXIsIHdlIG1heSB1c2UgdGhpcyBzdHlsZSBpbiBPcGVuQk1DIHByb2plY3R=
z
Ljxicj48YnI+SW4gcmVjZW50IHJldmlld3MgSSBzZWUgc29tZSBjb21tZW50cyBhYm91dCB0aGU=
g
cHJvYmxlbXMgYW5kIGRlYmF0ZSBvbiBDKysgY2xhc3MncyBtZW1iZXJzIGFuZCBmdW5jdGlvbiB=
w
YXJhbWV0ZXJzLjxicj48YnI+RS5nLjxicj4xLgogSW4gZ2VuZXJhdGVkIHNkYnVzcGx1cyBjb2R=
l
LCB3ZSBtYXkgaGFwcGVuIHRvIHVzZSBDKysncyBrZXl3b3JkcyBhcyAKY2xhc3MgbWVtYmVycyw=
g
c3VjaCBhcyBgc2VydmVyOjpEZWxldGU6OmRlbGV0ZWAuIFRoaXMgaXMgYWRkcmVzcyBieSAKaHR=
0
cHM6Ly9nZXJyaXQub3BlbmJtYy1wcm9qZWN0Lnh5ei8jL2MvMTQ4MS88YnI+Mi4gU29tZXRpbWV=
z
IHdlIHVzZSB0aGUgc2FtZSBuYW1lIGZvciBhIGNsYXNzJ3MgbWVtYmVyIGFuZCBmdW5jdGlvbiB=
w
YXJhbWV0ZXIsIHN1Y2ggYXM6PGJyPiZuYnNwOyZuYnNwOyBgYGBjKys8YnI+Jm5ic3A7Jm5ic3A=
7
IGNsYXNzIEhvc3Qgezxicj4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgc2RidXNwbHVzOjpidXM=
6
OmJ1cyZhbXA7IGJ1czs8YnI+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IEhvc3Qoc2RidXNwbHV=
z
OjpidXM6OmJ1cyZhbXA7IGJ1cywgLi4uKTxicj4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJ=
z
cDsgOiBidXMoYnVzKTxicj4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgey4uLn08YnI+Jm5ic3A=
7
Jm5ic3A7IH07PGJyPiZuYnNwOyZuYnNwOyBgYGA8YnI+Jm5ic3A7Jm5ic3A7IFRoaXMgaXMgT0s=
s
IGJ1dCBzb21lIHJldmlld2Vycy9yZWFkZXJzIG1heSBmZWVsIGEgYml0IHN0cmFuZ2Ugb24gdGh=
l
IGNvZGUuPGJyPiZuYnNwOyZuYnNwOyBTb21lIG9uZSBwcmVmZXIgdW5kZXJzY29yZXMgbGlrZSB=
g
X2J1c2AgdG8gcmVzb2x2ZSB0aGlzIGlzc3VlLCBzb21lIG90aGVyIG1heSBmZWVsIGBidXNgIGl=
z
IGp1c3QgZ29vZC48YnI+My4gV2UgbWF5IHdhbnQgdG8gZGVmaW5lIGEgb2JqZWN0IHdpdGggdGh=
l
IHNhbWUgbmFtZSBhcyBjbGFzcydzIG5hbWUsIHN1Y2ggYXM6PGJyPiZuYnNwOyZuYnNwOyBgYGB=
j
Kys8YnI+Jm5ic3A7Jm5ic3A7IGNsYXNzIGZvbyB7PGJyPiZuYnNwOyZuYnNwOyZuYnNwOyZuYnN=
w
OyAuLi48YnI+Jm5ic3A7Jm5ic3A7IH07PGJyPiZuYnNwOyZuYnNwOyAvL2ZvbyBmb287IC8vIFR=
o
aXMgZG9lcyBub3QgY29tcGlsZTxicj4mbmJzcDsmbmJzcDsgZm9vIG15Rm9vOyAvLyBXZSdsbCB=
o
YXZlIHRvIHVzZSBhIGRpZmZlcmVudCBuYW1lPGJyPiZuYnNwOyZuYnNwOyBgYGA8YnI+NC4KIER=
1
cmluZyByZWFkaW5nIHRoZSBjb2RlLCBzb21ldGltZXMgaXQncyBoYXJkIHRvIGZpbmQgaWYgYSB=
2
YXJpYWJsZSBpcyBhCiBsb2NhbCB2YXJpYWxiZSwgb3IgdGhlIGNsYXNzJ3MgbWVtYmVyLCBvciB=
h
IGNvbnN0YW50LCBzdWNoIGFzOjxicj4mbmJzcDsmbmJzcDsgYGBgYysrPGJyPiZuYnNwOyZuYnN=
w
OyBjbGFzcyBIb3N0IHs8YnI+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IHN0ZDo6c3RyaW5nIHN=
v
bWVQYXRoOzxicj4mbmJzcDsmbmJzcDsgfTs8YnI+Jm5ic3A7Jm5ic3A7IC4uLjxicj4mbmJzcDs=
m
bmJzcDsgY29uc3QgY2hhciogY29uc3RQYXRoID0gInh4eCI7PGJyPiZuYnNwOyZuYnNwOyBIb3N=
0
Ojp4eHgoY29uc3QgY2hhciogYW5vdGhlclBhdGgpIHs8YnI+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5=
i
c3A7IHN0ZDo6c3RyaW5nIHRoZVRoaXJkUGF0aDs8YnI+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A=
7
IC8vIEluIHRoaXMgZnVuY3Rpb24sIGhvdyBkbyB3ZSB0ZWxsIGlmIHh4eFBhdGggaXMgYSBsb2N=
h
bCB2YXJpYWJsZSBvciBjbGFzcydzIG1lbWJlcj88YnI+Jm5ic3A7Jm5ic3A7IH08YnI+Jm5ic3A=
7
Jm5ic3A7IGBgYDxicj48YnI+VGhlIG5hbWluZyBzdHlsZSBJIGludHJvZHVjZSB3aWxsIGFkZHJ=
l
c3MgYWxsIHRoZXNlICJwcm9ibGVtcyIuPGJyPjEuIEFsbCBjbGFzc2VzLCBzdHJ1Y3RzLCBlbnV=
t
cyBzdGFydCB3aXRoICJUIiwgZS5nLiBgVFVwcGVyQ2FtZWxDYXNlYDxicj4yLiBBbGwgaW50ZXJ=
m
YWNlcyAod2l0aCBwdXJlIHZpcnR1YWwgZnVuY3Rpb25zKSBzdGFydHMgd2l0aCAiSSIsIGUuZy4=
g
YElVcHBlckNhbWVsQ2FzZWA8YnI+My4gQWxsIG1lbWJlcnMgYW5kIGZ1bmN0aW9ucyBvZiBhIGN=
s
YXNzIHVzZSBgVXBwZXJDYW1lbENhc2VgPGJyPjQuIEFsbCBmdW5jdGlvbiBwYXJhbWV0ZXJzIGF=
u
ZCBsb2NhbCB2YXJpYWJsZXMgdXNlcyBgbG93ZXJDYW1lbENhc2VgPGJyPjUuIEFsbCBjb25zdCB=
v
ciBjb25zdGV4cHIgdXNlcyBgQUxMX1VQUEVSX0NBU0VgLCB0aGUgc2FtZSBmb3IgZW51bSdzIHZ=
h
bHVlcy48YnI+PGJyPioqTm90ZToqKiBBbGwgdGhlc2Ugc3R5bGVzIGFwcGx5IHRvIGFwcGxpY2F=
0
aW9uIGNvZGUsIGlmIHRoZSBjb2RlIGlzIHRvIHByb3ZpZGUgYSBsaWJyYXJ5IGxpa2UgU1RMLCB=
r
ZWVwIFNUTCBzdHlsZS48YnI+PGJyPldpdGggdGhlIGFib3ZlIHN0eWxlcywgd2UgY2FuIHNlZSB=
h
bGwgdGhlIGFib3ZlICJwcm9ibGVtcyIgYXJlIHJlc29sdmVkOjxicj4xLiBCZWNhdXNlIGNsYXN=
z
IG1lbWJlcnMgYXJlIGluIGBVcHBlckNhbWVsQ2FzZWAsIHNvIGl0IHdpbGwgbm90IHVzZSBDKys=
n
cyByZXNlcnZlZCBrZXl3b3JkcyBhdCBhbGw7PGJyPjIuCiBCZWNhdXNlIGNsYXNzZXMgYXJlIGl=
u
IGBUVXBwZXJDYW1lbENhc2VgLCBhbmQgcGFyYW1ldGVycyBhcmUgaW4gCmBsb3dlckNhbWVsQ2F=
z
ZWAsIHdlIHdvbid0IGhhdmUgc2FtZSBuYW1lcyBmb3IgY2xhc3MgbWVtYmVycyBhbmQgCmZ1bmN=
0
aW9uIHBhcmFtZXRlcnM8YnI+Jm5ic3A7Jm5ic3A7IGBgYGMrKzxicj4mbmJzcDsmbmJzcDsgY2x=
h
c3MgVEhvc3Qgezxicj4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgc2RidXNwbHVzOjpidXM6OmJ=
1
cyZhbXA7IEJ1czs8YnI+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IFRIb3N0KHNkYnVzcGx1czo=
6
YnVzOjpidXMmYW1wOyBidXMsIC4uLik8YnI+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A=
7
IDogQnVzKGJ1cyk8YnI+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IHsuLi59PGJyPiZuYnNwOyZ=
u
YnNwOyB9Ozxicj4mbmJzcDsmbmJzcDsgYGBgPGJyPjMuIEJlY2F1c2UgY2xhc3NlcyBhcmUgaW4=
g
YFRVcHBlckNhbWVsQ2FzZWAsIHdlIGNhbiBhbHdheXMgZGVmaW5lIGEgdmFyaWFibGUvbWVtYmV=
y
IHdpdGggdGhlIG5hbWUgd2UgbGlrZTo8YnI+Jm5ic3A7Jm5ic3A7IGBgYGMrKzxicj4mbmJzcDs=
m
bmJzcDsgY2xhc3MgVEZvbyB7PGJyPiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyAuLi48YnI+Jm5=
i
c3A7Jm5ic3A7IH07PGJyPiZuYnNwOyZuYnNwOyBURm9vIEZvbzsgLy8gT0sgZm9yIGNsYXNzIG1=
l
bWJlcjxicj4mbmJzcDsmbmJzcDsgVEZvbyBmb287IC8vIE9LIGZvciBsb2NhbCB2YXJpYWJsZXM=
8
YnI+Jm5ic3A7Jm5ic3A7IGBgYDxicj40LiBXZSBjYW4gYWx3YXlzIHRlbGwgaWYgYSB2YXJpYWJ=
s
ZSBpcyBhIGNsYXNzJ3MgbWVtYmVyLCBvciBhIGxvY2FsIHZhcmlhYmxlLCBvciBjb25zdGFudHM=
s
IG9yIGEgZnVuY3Rpb24gY2FsbC48YnI+Jm5ic3A7Jm5ic3A7IGBgYGMrKzxicj4mbmJzcDsmbmJ=
z
cDsgY2xhc3MgVEhvc3Qgezxicj4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgc3RkOjpzdHJpbmc=
g
U29tZVBhdGg7PGJyPiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBlbnVtIGNsYXNzIFRWYWx1ZSB=
7
PGJyPiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBPTkUsPGJyPiZuYnNwOyZ=
u
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBUV08sPGJyPiZuYnNwOyZuYnNwOyZuYnNwOyZ=
u
YnNwOyZuYnNwOyZuYnNwOyBUSFJFRTxicj4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgfTs8YnI=
+
Jm5ic3A7Jm5ic3A7IH07PGJyPiZuYnNwOyZuYnNwOyAuLi48YnI+Jm5ic3A7Jm5ic3A7IGNvbnN=
0
IGNoYXIqIENPTlNUX1BBVEggPSAieHh4Ijs8YnI+Jm5ic3A7Jm5ic3A7IFRIb3N0Ojp4eHgoY29=
u
c3QgY2hhciogYW5vdGhlclBhdGgsIFRGb28qIGZvbykgezxicj4mbmJzcDsmbmJzcDsmbmJzcDs=
m
bmJzcDsgc3RkOjpzdHJpbmcgdGhlVGhpcmRQYXRoOzxicj4mbmJzcDsmbmJzcDsgJm5ic3A7IGZ=
v
by0mZ3Q7SW52b2tlTWV0aG9kKCk7PGJyPiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyAvLyBCeSB=
y
ZWFkaW5nIHRoZSBjb2RlIChldmVuIHdpdGggaGVhZGVyIGZpbGUpLCB3ZSBrbm93Ojxicj4mbmJ=
z
cDsmbmJzcDsgJm5ic3A7IC8vPGJyPiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyAvLyAiU29tZVB=
h
dGgiIGlzIGNsYXNzJ3MgbWVtYmVyIGFzIFRIb3N0OjpTb21lUGF0aDxicj4mbmJzcDsmbmJzcDs=
m
bmJzcDsmbmJzcDsgLy8gIkNPTlNUX1BBVEgiIGFuZCAiT05FL1RXTy9USFJFRSIgYXJlIGNvbnN=
0
YW50czxicj4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgLy8gKmFub3RoZXJQYXRoKiBhbmQgKnR=
o
ZVRoaXJkUGF0aCogYXJlIGxvY2FsIHZhcmlhYmxlczxicj4mbmJzcDsmbmJzcDsgJm5ic3A7IC8=
v
ICJmb28tJmd0O0ludm9rZU1ldGhvZCgpIiBpcyB0byBjYWxsIFRGb286Okludm9rZU1ldGhvZCg=
p
IGZ1bmN0aW9uPGJyPiZuYnNwOyZuYnNwOyB9PGJyPiZuYnNwOyZuYnNwOyBgYGA8YnI+PGJyPkk=
g
dGhpbmsgdGhpcyBzdHlsZSBpcyBzaW1wbGUgYW5kIGVmZmVjdGl2ZSwgYW5kIGl0IGltcHJvdmV=
z
IHJlYWRhYmlsaXR5Ljxicj5XaGF0IGRvIHlvdSB0aGluaz88YnI+PGJyPi0tPGJyPjwvZGl2PkJ=
S
cyw8YnI+PC9kaXY+TGVpIFlVPGJyPg=3D=3D" style=3D"height:0;width:0;max-height:=
0;max-width:0;overflow:hidden;font-size:0em;padding:0;margin:0">=E2=80=8B</=
div></div></div>

--001a114a8062eee4770544136a8b--

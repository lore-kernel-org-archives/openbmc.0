Return-Path: <andrew@aj.id.au>
Received: from homiemail-a18.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qzN7j3WmJzDq60
 for <openbmc@lists.ozlabs.org>; Tue,  3 May 2016 10:57:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=jwbVOs3o; 
 dkim-atps=neutral
Received: from homiemail-a18.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a18.g.dreamhost.com (Postfix) with ESMTP id A847925006C;
 Mon,  2 May 2016 17:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version:content-transfer-encoding; s=aj.id.au
 ; bh=LtkqFbgKZ48ya9AQ7h611GZWLDg=; b=jwbVOs3ouwIux125bORiDO8L+4m
 sFroVmF9AhsRCj/cJCo+1tBBAYhcmzXkPXjiVzIBUGwl7wRZOK8DKxJkjk3ZBTd4
 mB+OTDEK3vLXZwPueP0jon27LRmnJqYEMzdzLSRBsyQOyZLzUpiZONr5husZBsYZ
 BE7XPGhLcSaropX0=
Received: from keelia (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a18.g.dreamhost.com (Postfix) with ESMTPSA id 6F5C3250065;
 Mon,  2 May 2016 17:57:50 -0700 (PDT)
Message-ID: <1462237067.3462.37.camel@aj.id.au>
Subject: Re: [PATCH pyphosphor v2 3/4] Added python to dts encoder
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Date: Tue, 03 May 2016 10:27:47 +0930
In-Reply-To: <1461949847-22156-4-git-send-email-openbmc-patches@stwcx.xyz>
References: <1461949847-22156-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1461949847-22156-4-git-send-email-openbmc-patches@stwcx.xyz>
Organization: IBM OzLabs
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.18.5.2-0ubuntu1 
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 03 May 2016 00:57:53 -0000

Hi Brad,

On Fri, 2016-04-29 at 12:10 -0500, OpenBMC Patches wrote:
> From: Brad Bishop <bradleyb@us.ibm.com>
>=20
> This is a rudimentary python to device tree encoder.
>=20
> It supports nested nodes and, cell, cell array,
> string, string array, and mixed array properties.
> At the moment there is no support for binary properties.

I see you changed the handling of the list case along the lines of what
I suggested, but any thoughts on the tests? That was my main area of
concern.

Cheers,

Andrew

> ---
> =C2=A0obmc/utils/dtree.py | 74 ++++++++++++++++++++++++++++++++++++++++=
+++++++++++++
> =C2=A01 file changed, 74 insertions(+)
> =C2=A0create mode 100644 obmc/utils/dtree.py
>=20
> diff --git a/obmc/utils/dtree.py b/obmc/utils/dtree.py
> new file mode 100644
> index 0000000..59d03da
> --- /dev/null
> +++ b/obmc/utils/dtree.py
> @@ -0,0 +1,74 @@
> +# Contributors Listed Below - COPYRIGHT 2016
> +# [+] International Business Machines Corp.
> +#
> +#
> +# Licensed under the Apache License, Version 2.0 (the "License");
> +# you may not use this file except in compliance with the License.
> +# You may obtain a copy of the License at
> +#
> +#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0http://www.apache.org/licenses/LICENSE-=
2.0
> +#
> +# Unless required by applicable law or agreed to in writing, software
> +# distributed under the License is distributed on an "AS IS" BASIS,
> +# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
> +# implied. See the License for the specific language governing
> +# permissions and limitations under the License.
> +
> +
> +def dts_encode(obj, fd, **kw):
> +=C2=A0=C2=A0=C2=A0=C2=A0''' A rudimentary python to dts encoder.
> +=C2=A0=C2=A0=C2=A0=C2=A0'''
> +=C2=A0=C2=A0=C2=A0=C2=A0indent =3D kw.get('indent', 0)
> +=C2=A0=C2=A0=C2=A0=C2=A0depth =3D kw.setdefault('depth', 0)
> +=C2=A0=C2=A0=C2=A0=C2=A0tab =3D indent * depth * ' '
> +=C2=A0=C2=A0=C2=A0=C2=A0kw['depth'] +=3D 1
> +=C2=A0=C2=A0=C2=A0=C2=A0newline =3D '\n' if indent else ' '
> +=C2=A0=C2=A0=C2=A0=C2=A0context =3D kw.get('context')
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0if(isinstance(obj, dict)):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0nodes =3D []
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0for k, v in obj.iterit=
ems():
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
if(isinstance(v, dict)):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0nodes.append((k, v))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0continue
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
if(isinstance(v, basestring) and v.lower() =3D=3D 'true'):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0fd.write('%s%s' % (tab, k))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
elif(isinstance(v, basestring) and v.lower() =3D=3D 'false'):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0continue
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
else:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0fd.write('%s%s =3D ' % (tab, k))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0dts_encode(v, fd, **kw)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
fd.write(";%s" % newline)
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0for k, v in nodes:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
fd.write('%s%s {%s' % (tab, k, newline))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
dts_encode(v, fd, **kw)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
fd.write('%s};%s' % (tab, newline))
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0if(isinstance(obj, int)):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if context =3D=3D 'int=
_list':
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
fd.write("%d" % obj)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0else:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
fd.write("<%d>" % obj)
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0if(isinstance(obj, basestring)):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0fd.write("\"%s\"" % ob=
j)
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0if(isinstance(obj, list)):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ctx =3D 'int_list' if =
all((type(x) is int) for x in iter(obj)) else ''
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if ctx is 'int_list':
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
delim =3D ' '
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
closure =3D ('<', '>')
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0else:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
delim =3D ','
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
closure =3D ('', '')
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0fd.write(closure[0])
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if obj:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
for v in obj[:-1]:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0dts_encode(v, fd, context=3Dctx, **kw)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0fd.write(delim)
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
dts_encode(obj[-1], fd, context=3Dctx)
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0fd.write(closure[1])

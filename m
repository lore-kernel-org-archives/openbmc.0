Return-Path: <andrew@aj.id.au>
Received: from homiemail-a23.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 by lists.ozlabs.org (Postfix) with ESMTP id D9AB91A0007
 for <openbmc@lists.ozlabs.org>; Wed, 24 Feb 2016 11:11:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=qwdw3cYv; 
 dkim-atps=neutral
Received: from homiemail-a23.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a23.g.dreamhost.com (Postfix) with ESMTP id 962EE4B006F;
 Tue, 23 Feb 2016 16:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=BJBoToqWLZDqoskU/4LXI
 nApX5M=; b=qwdw3cYvcE/nmgXiyp07R+ldtmGZrVfz/2k1m6P5jWPjzsFKDAU7A
 RVOEmp4ukwdph/R+bl75WVQ8fmDEBhfH0M1o8I7dhXPHKsyu+81yiZXy+lxIVM7g
 mOlnl9guSLnVcfsmC8DeWViLKvF+tAeZ9zDGXfZSB4XkdD9KbbMIIA=
Received: from keelia (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a23.g.dreamhost.com (Postfix) with ESMTPSA id 9CF2F4B0063;
 Tue, 23 Feb 2016 16:11:35 -0800 (PST)
Message-ID: <1456272691.27420.26.camel@aj.id.au>
Subject: Re: [PATCH v3 3/6] obmc-{init, update}.sh: Cope with alternate RW
 FS types
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: Milton Miller II <miltonm@us.ibm.com>, Joel Stanley <joel@jms.id.au>
Cc: OpenBMC <openbmc@lists.ozlabs.org>
Date: Wed, 24 Feb 2016 10:41:31 +1030
In-Reply-To: <201602232337.u1NNb2FU028651@d01av02.pok.ibm.com>
References: <CACPK8XfMJWUjNv8+fZQyGdKVqN-QVVo-vUVKX0s=vWUD2+AwOg@mail.gmail.com>
 ,<1456238703-11117-1-git-send-email-andrew@aj.id.au>
 <1456238703-11117-4-git-send-email-andrew@aj.id.au>
 <201602232337.u1NNb2FU028651@d01av02.pok.ibm.com>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-ScWJHkmYVqx96pen6Mbp"
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
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
X-List-Received-Date: Wed, 24 Feb 2016 00:11:38 -0000


--=-ScWJHkmYVqx96pen6Mbp
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2016-02-23 at 23:36 +0000, Milton Miller II wrote:
> (me found a new mailer option)
>=20
> Around 02/23/2016 05:02PM in some time zone, Joel Stanley wrote:
> >
> >On Wed, Feb 24, 2016 at 1:15 AM, Andrew Jeffery <andrew@aj.id.au>
> >wrote:
> >> Busybox's blkid is a little hamstrung, requiring some processing of
> >>the
> >> output to emulate what can be achieved with a couple of options
> >>with
> >> blkid from util-linux.
> >>
> >> Similar to findmtd(), the code for probe_fs_type() and
> >>blkid_fs_type()
> >> is duplicated between obmc-{init,update}.sh. Some consideration
> >>should
> >> be given to splitting out common functionality into well-defined
> >> sourcable scripts.
> >
> >Why not do that? :)

Because I was trying to avoid bikeshedding where and how, at the
expense of introducing some minor problems :)

>=20
> Well, for one , it reduces the reliability of the script and increases=
=20
> the time by requiring opening and finding additional files.  But we=20
> could put all these variables in that file with it.
>=20
> I vote for later.

Soo: what am I extracting, where am I putting it, and are we going to
bother splitting what we extract into functional pieces? Or just lump
unrelated functionality into a single file?

>=20
> >
> >Put an example of the input and what you expect as the output in the
> >comment.
> >
>=20
> One can run the command if they need to see it, and its common to
> ubuntu and busybox.
>=20
> >> + blkid $1 \
> >> + | tr ' ' '\n' \
> >> + | awk -F=3D '/TYPE/ { print $2 }' \
> >> + | tr -d '"'
> >> +}
> >> +
>=20
> But more awk less pipes!
>=20
> -       blkid $1 \
> -               | tr ' ' '\n' \
> -               | awk -F=3D '/TYPE/ { print $2 }' \
> -               | tr -d '"'
> +       blkid $1 | awk ' { if (match($0, / TYPE=3D"[^"]*"/)) {
> +                               print substr ($0, RSTART+7, RLENGTH-8);
> +                               exit 0; }
> +                       }'

IMO this alternative is less readable: I find it relatively harder to
parse the regex (with character classes and repetition operators) and
then perform substring indexing, than to follow the pipeline of
substitutions and a straight text match. Horses for courses? Less pipes
means less subprocesses but do we really care here?

>=20
> busybox awk does not have the gawk match third arg; the exit 0=20
> says first arg only which should be redundant, and the extra new line=20
> makes it a bit more readable at the expense of being the 4th line.
> alternatively we could look at each arg in a for loop but I decided it
> just added more code than matching the leading space.
>=20
> This also gets rid of those trailing backslashes (otherwise accomplished=
=20
> by putting the pipe at the end of the line).

Fair point about the EOL pipes. The backslashes are ugly.

>=20
> (I'll submit this as a patch on top; you can fold or rebase).
>=20
> >> +probe_fs_type() {>> + fst=3D$(blkid_fs_type $1)
> >> + echo ${fst:=3Djffs2}
> >> +}
> >> +
> >> rwfs=3D$(findmtd rwfs)
> >>
> >> rwdev=3D/dev/mtdblock${rwfs#mtd}
> >> -rwfst=3Dext4
> >
> >Would it make sense to do the same as the init case, where you set
> >rwfst to $(probe_fs_type $rwdev)?
>=20
> Not as useful because the type needs be able to change=20
> between before and after ... so we need 2 options and one can=20
> not be probed until after flashing.

You beat me to it :)


>=20
> milton
>=20
--=-ScWJHkmYVqx96pen6Mbp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABCgAGBQJWzPU0AAoJEJ0dnzgO5LT5UxIP/2vv1Qat4lt8UtAI7CgkOmX9
8cVIi0ja7HFI+4KVzYm9bkTwFEdG6u9kekNzEhmPPAimN4jNfjN+zOHu/gJi4Es/
JayneOpggLH+dVcgKcHFDQ1TFTzVqfBD3nWl0nq4xpCDldVVBZvbcP7gn1NgJLPx
WYuxlmNBrSeci3kkTOLbL0Wyw5hpBK6Lt2n88hJiCKwS7Jjb8NivfR05pDNQZAvC
uxiKJ6IbGazS5Bk8LFUabV8K/7PVk08ZV8BEIYGN+SXljux7qayXiuJvvxtmg/cz
126zZMmyKUNYoi547+og2aLdYSM5CORsMH8r3s7HwwenyWmvpPL6CbdOeausEz6X
dbcjE0pviE0JuEZ0BTokU2sY3qv3aKLZxyAdeKQNnlnysmu05wql5Vc//D8EDWhD
s8HjPWqFeEleO5mqn7Kbm+8qOStpJfhtCH3fMuHak+/+fu2aV5KT/rx8NQrTzyf2
MpFX9ymAlbAw7BabnBE4rGGRKr+iCQR+RFyg1YoA8SU7gLi8bSZyJgULcDx6Tpln
uXV8XjvHaE5V71WZrBdNDxQS/9VBo4dSvDhu1Eq9p2fiOrfgN3bZ0V8bZKPdtCWX
8kaRM8C1IjzNPCnZHGOzFdmFgqqVMcb6LG1ssD9baYCYJhg5t41I15JJ7+W1yOfr
Itiy6FDqrYPaZOm1mYMC
=Evnz
-----END PGP SIGNATURE-----

--=-ScWJHkmYVqx96pen6Mbp--

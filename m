Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c06::22b; helo=mail-oi0-x22b.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="WnmM0Ptx"; 
 dkim-atps=neutral
Received: from mail-oi0-x22b.google.com (mail-oi0-x22b.google.com
 [IPv6:2607:f8b0:4003:c06::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41zWsZ53TqzDqSL
 for <openbmc@lists.ozlabs.org>; Mon, 27 Aug 2018 22:48:50 +1000 (AEST)
Received: by mail-oi0-x22b.google.com with SMTP id m11-v6so27018258oic.2
 for <openbmc@lists.ozlabs.org>; Mon, 27 Aug 2018 05:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3PcxAvDbk4HXOeDdUv14+s4BZByfAoUmyIhcUQqFKSI=;
 b=WnmM0Ptx7GaWqIoQOOl7oCd3JkXss64+HeYN+WTzMAqybFLjRWNv/uXb4dYT4Rp8pa
 vg2AUFBYGJCMpaHpXcxfFmvHMUYtl00cX8bxb+yhwvXl0tF7DnB5wKi6TWFF6MuYY5OX
 kVpgkHCl9Op7fF6aPawKWDs+LleJ0mDFxKPmYTN4dSXMehfAviOYHRYUAQmTNxzk/koc
 Yhn3WnW5/9EX6QhvpTniSAD0D0UCaHU3wmTFeWX2NY/bjfiC4a2KCEkfXSUXT6XTAP6U
 rEi41OYJ5jdTSEmckvys0alMhByj4d8pJd/0R4MCoSjZ9nUu4EDloYpF8ZWKzMDhzZts
 8szg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3PcxAvDbk4HXOeDdUv14+s4BZByfAoUmyIhcUQqFKSI=;
 b=SnqkwH09VzBwEbfxH5ESMFZXWAVjqHjpXkNTHLNPj/lwCOISojF2WPBOg69eK61vO2
 wLdMzaSJDRi3FJNcBqluCbvdn03DTvbprXB5wyEpigSQATndoHpTI5J+Bqoy4VTyGpER
 lDlopdVNy8KisagPgDYHeYcuu8rL+9eE3vMwq6GS+B6anB5rD4DBkKhWWxoL/RW/VSla
 s+bEQPOFTXAjwn//LD3kZBGr2HVopajB1KZM+iHhdhM43WnkqtAcSxrPkUealW5d+Jtk
 5df+o7E557OvxM1EnaYaVEypLZYDHPFh4GjTLYJ6/fll+nsMoMu1owsEiveCM4hgynqn
 aDSQ==
X-Gm-Message-State: APzg51Bg5QM/pilnw7PcyZzpo/7bohSzmiE0oJ+0roAoUD8ql9x0eaHb
 8JDDqDVGkKzLnt6MX0TFqh6sQd8+4N+a0ywUzjE=
X-Google-Smtp-Source: ANB0VdaulXQvzIKoQ1CXp8V6YHS7AWA8WuO62aucewEWQdKBgTw+Q3X+O1LPvloiFz4IBrSJGCzInFk0CQqSVmTwUDk=
X-Received: by 2002:aca:5dc5:: with SMTP id
 r188-v6mr13069828oib.320.1535374127377; 
 Mon, 27 Aug 2018 05:48:47 -0700 (PDT)
MIME-Version: 1.0
References: <7E9441B1E5EFFD4681F54958E821699345835738@ORSMSX114.amr.corp.intel.com>
In-Reply-To: <7E9441B1E5EFFD4681F54958E821699345835738@ORSMSX114.amr.corp.intel.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Mon, 27 Aug 2018 07:48:36 -0500
Message-ID: <CALLMt=onADDRBk1w-zkxSEq-8XQQxbOrkP-zAVP9x+pFbN1oAA@mail.gmail.com>
Subject: Re: SOL Logging
To: ed.tanous@intel.com
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Aug 2018 12:48:52 -0000

On Fri, Aug 24, 2018 at 4:03 PM Tanous, Ed <ed.tanous@intel.com> wrote:
>
> I would like to start a discussion around the feature of SOL logging, and=
 how to best implement it.
>
>
>
> There is a proposal here https://gerrit.openbmc-project.xyz/#/c/openbmc/p=
hosphor-webui/+/12063/ that proposes dumping the SOL console text buffer fr=
om Javascript into a file, and presenting it to the user as a download.  On=
 its face, it seems to work as designed.  This has some pretty severe limit=
ations, in that you can only dump the console log from your session, and yo=
ur session is essentially destroyed when you switch pages in the webui, or =
hit refresh.  I think this is overly limiting, and of the production BMC st=
acks that I know of, none of them implement SOL logging in this way.
>
>
>
> Instead, other BMCs implement it as a circular buffer inside the BMC itse=
lf, which allows SOL to log data all the time, not just while the user is l=
ogged in.  I think architecting it this way would be much more useful for a=
dmins consuming OpenBMC, and make us more useful as a solution.  Doing it t=
his way also can make the SOL log available to IPMI and Redfish, as well as=
 a file download, which improves the usability quite a bit.  Most places I =
see the SOL logging requested is for audit type purposes, which the javascr=
ipt based version can=E2=80=99t do.

We use https://github.com/openbmc/obmc-console for this currently.  It
creates a file at /var/log/obmc-console.log and even has a
customizable size for the file to wrap at. I guess the advantage of
having it in the GUI is the user could ensure a full dump of the
console (vs. just grabbing the existing obmc-console.log which may
have wrapped). Being able to view the SOL output has it happens in the
GUI, then having an option to export it sounds kind of useful.  Also
be nice to be able to retrieve and view the existing obmc-console.log
from the system in case you missed it in the GUI.  Maybe that latter
part is enough though, reduces GUI complexity and testing. Something
good to run by our usability/design team Gunnar/Rebecca?

>
>
> I=E2=80=99m looking for feedback from the community here.  As written, I =
don=E2=80=99t think the javascript console export is a useful feature given=
 its limitations.  Do others agree?  Am I off base?  Are there use models w=
here having a log of only the current session is useful?  Should we documen=
t the limitations so we can respond to bugs in the future?
>
>
>
> Thanks,
>
>
>
> -Ed

Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=209.85.214.193; helo=mail-pl1-f193.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="K53Bj13K"; 
 dkim-atps=neutral
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 424jvF6NjhzF37y
 for <openbmc@lists.ozlabs.org>; Wed,  5 Sep 2018 09:38:17 +1000 (AEST)
Received: by mail-pl1-f193.google.com with SMTP id e11-v6so2361772plb.3
 for <openbmc@lists.ozlabs.org>; Tue, 04 Sep 2018 16:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ApuaR/4IBvXIVm/w8o2f8+ij37eT7Y2ee3MKVL0uB4Q=;
 b=K53Bj13KHDuwwIoBDOWXceZdLfe89yku1S1BmybtBC1PFYKea7aniQyLPiwBEvBx1H
 cdnbrvPAaMh+6YKa3ROccFSLkaJgNJ43jLwXTLGA2lwG078MJ5X9/1mYhFdH+WPZJ2gW
 u8POnN9ia0Y9ne1Z98WizfPiLRswCSu9yT/PRqmpJxDlrPFif1dtIWsOpXsmb/F/fbS6
 rcdggha4VeSS/Qx+UcRBdUpzxXxjxreCxIu8S0yluyF7vENFCamd/z8tKue0Uw4Qq3o3
 rk3ux3MSk79ceMyXvi3RtDAPUOgCbQoDSr4zgemergBR+5xZqXDYU9sCxVJ/sZx5xccf
 eQpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ApuaR/4IBvXIVm/w8o2f8+ij37eT7Y2ee3MKVL0uB4Q=;
 b=SKtmsebSctO9/sWozOFEUSlHnxrQ0/EReZIMrvYrIKD8uBwE8aRv8E7j2Ly7FST8Cs
 +bnaz1lQf/J0oLXmO+81bVwB9h9xaoQq6jyHKooxhIyz161iX59z3j+QhGlm2/D/sG0i
 kGdor5WbWN4u6mf5vrxH2+D4qYrMRv40d8OTrXitMtr0LYP6lAOGcPDETkUcMv3SpMV9
 iTzuJV+EQehuY/Ll8KJL9mG9GH8oFOtE6gwG9QwKUQtRsWecWs03rOg2fhmjTqnc7hPS
 f+ekQvzaHzbvX+UBb389vVFCa1/LkP+i5VpJSol35sHgnCbYT+KMNkxI6FbPhQZtKSUk
 ANUQ==
X-Gm-Message-State: APzg51DstL2ZtoJ2yLg28XAxOAE+psqs5BpXbrxfefqfUnPLj0mZHXuA
 AtCKK6/1j3m5N3IAKTgKmnaypw7Xd9suMs4bJHwpmw==
X-Google-Smtp-Source: ANB0VdZ0/mgyxvSZPuJRoRxUgDVBnSynZELMrPKZx6/jmxUC9/TRk90YdNNsvuu7ZZtxAhpcQ3rQhtp6eYe8gyPCDxQ=
X-Received: by 2002:a17:902:6681:: with SMTP id
 e1-v6mr36181117plk.109.1536104294945; 
 Tue, 04 Sep 2018 16:38:14 -0700 (PDT)
MIME-Version: 1.0
References: <0ef9181f-eb70-552b-3411-da2bc9676be1@yadro.com>
 <CACPK8XdtitrjvDpuiPiz_ew03m972ueGRXAhd4kM_z6YSVtL3A@mail.gmail.com>
 <0E782585-1B8A-4BF7-9454-443061BA9C32@fuzziesquirrel.com>
 <CALLMt=rGmZ9-29xWMymUvdCAgVnFzQ+gyZDn3zXnWeR4imSYPA@mail.gmail.com>
 <359bcf51-5732-a65b-4b7e-dba2df0dd375@linux.vnet.ibm.com>
 <7E9441B1E5EFFD4681F54958E821699345836D0F@ORSMSX114.amr.corp.intel.com>
 <5755FBD3-3D78-4E3A-8F50-D4976EE3B2B2@fuzziesquirrel.com>
In-Reply-To: <5755FBD3-3D78-4E3A-8F50-D4976EE3B2B2@fuzziesquirrel.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 4 Sep 2018 16:38:03 -0700
Message-ID: <CAO=notzk_+Q_Pg4xcxzDL=Ux3gyMb2iE0pfSgygDw32wzBHB=w@mail.gmail.com>
Subject: Re: Proposals for commit log policy
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Alexander Amelkin <a.amelkin@yadro.com>, 
 gmills@linux.vnet.ibm.com, "Tanous, Ed" <ed.tanous@intel.com>
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
X-List-Received-Date: Tue, 04 Sep 2018 23:38:19 -0000

On Tue, Sep 4, 2018 at 1:20 PM Brad Bishop <bradleyb@fuzziesquirrel.com> wr=
ote:
>
>
>
> > On Aug 28, 2018, at 6:20 PM, Tanous, Ed <ed.tanous@intel.com> wrote:
> >
> >>
> >> I object too. I don't think the benefit of manual bumps is worth the e=
ffort.
> >>
> >
> > Another vote for "I don't think it's worth the effort".
> >
> > Automatic bumps keep us up to date and make breakages happen and get fi=
xed faster.  I would actually prefer that every gerrit review creates a man=
ual bump to make sure the complete system builds with their given component=
 change, but I realize this is hard to do.
> >
> > -Ed
>
> The autobump script stopped working when we switched to yocto-style subtr=
ees.
>
> I fixed it up (by re-writing it in python=E2=80=A6it was in Perl) and re-=
deployed, given
> all the objections.

Yay.  No more perl!

>
> -brad

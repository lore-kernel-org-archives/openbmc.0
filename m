Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c06::233; helo=mail-oi0-x233.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="GD5YLYQI"; 
 dkim-atps=neutral
Received: from mail-oi0-x233.google.com (mail-oi0-x233.google.com
 [IPv6:2607:f8b0:4003:c06::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42FnvN5jJSzDrhl
 for <openbmc@lists.ozlabs.org>; Thu, 20 Sep 2018 04:09:52 +1000 (AEST)
Received: by mail-oi0-x233.google.com with SMTP id c190-v6so5935146oig.6
 for <openbmc@lists.ozlabs.org>; Wed, 19 Sep 2018 11:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Z0a/iYrwrYicLyyBCKypkhuv/ucR4NNge3rhRfge7OA=;
 b=GD5YLYQIFm9dJG6/YIDTISiVNtw/YAoQFsp7MJOzrw+akdbLNN0WgrWPOCwAHuGzdV
 S/d50LJneyp2MDV/Hr7N/jX7FcZN8p5fq1ao0X50gNXgZcbkgzKl8HK5OGPQc97nIvU+
 j2XkGFAik/b9r68Qh7FBDIFhZvlOyg1uZNpFbeqdfD5NwLDPoU2CmJqlCzqexrE51F2i
 52OASSP6IlnXZORmNn0js6rcHOPDOidkSlr+nLieoT7jB4r03pm2YAkcmehkv7rjNRL/
 rkI6x+xq65cG3WK8vRdPWZdX9Lt67O2BgWXo2RB+vRJAqdrNyGmeS+Q4NHlp8rpJlqE2
 pOZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Z0a/iYrwrYicLyyBCKypkhuv/ucR4NNge3rhRfge7OA=;
 b=Pm9JLKQXwsjASwphOUzNlPsNvRwylkmqGhEArxQKe1yYbsl0Qnw9g4JsOR+7/ANBEi
 DVXj7Z9vCQ2aJuMXMks5s9sHvvPvI7guFYSeDA0Gu3Mr2bLQGuyMsj0K++gpMLSQ0Srg
 JF0xKphzMVHMgmahIKERslR/1diEArGEkkBZzbNeYt2AV37dc52G2MdgC58KLGS1d4m6
 hMEJMgNZx32XIc0tj6ZgNrtvPbTdhck+dWdhh71Wp9mta42Yk9znW6HbN1T1A7t0UXlw
 VOxyGorcdsDYDgiURoeA2VtPL4lO/sSUtdNE7fTmcaUR/SSF0GKV2mzO+QjXyGg0yFmD
 pjjw==
X-Gm-Message-State: APzg51AF2UmA8R5GS+hwmBzczt+QqcNVZIDczwRZZSIrMxnNVexyILlx
 C/ObBZAFqJ5KeBdT1uwZnEmmHac0c96Rz3YUhIc=
X-Google-Smtp-Source: ANB0VdZCfFdDxKG6uPSnOYfg8v784OG/zeZD4ulwBjcvqtmdLfzdcz0H+vP2KG603NxqdvvsjCol+90cz7pD4rgIRQU=
X-Received: by 2002:aca:90d:: with SMTP id 13-v6mr2506542oij.300.1537380589896; 
 Wed, 19 Sep 2018 11:09:49 -0700 (PDT)
MIME-Version: 1.0
References: <dVwK1y00D1vEVCc01VwKs6@charter.net>
In-Reply-To: <dVwK1y00D1vEVCc01VwKs6@charter.net>
From: Andrew Geissler <geissonator@gmail.com>
Date: Wed, 19 Sep 2018 13:09:38 -0500
Message-ID: <CALLMt=pqSRi90cju_Gr1gBe+n9giWeM6LHYQ=MTnKDGEaaVifA@mail.gmail.com>
Subject: Re: Repository Growth
To: joseph-reynolds@charter.net
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Sep 2018 18:09:53 -0000

On Wed, Sep 19, 2018 at 12:56 PM <joseph-reynolds@charter.net> wrote:
>
>
> Date: Wed, 19 Sep 2018 09:42:16 -0700
> From: Patrick Venture <venture@google.com>
> To: anoo@linux.ibm.com
> Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Brad Bishop
> <bradleyb@fuzziesquirrel.com>, Nancy Yuen <yuenn@google.com>,
> openbmc-bounces+anoo=3Dlinux.ibm.com@lists.ozlabs.org
> Subject: Re: Repository Growth
> Message-ID:
> <CAO=3DnotwvBca4ANU6b-kQggP53cM2CdsCVV5QqsBYUCJ_jB+Xkg@mail.gmail.com>
> Content-Type: text/plain; charset=3D"UTF-8"
>
> On Wed, Sep 19, 2018 at 9:03 AM Adriana Kobylak <anoo@linux.ibm.com> wrot=
e:
> >
> > On 2018-09-19 10:47, Patrick Venture wrote:
> > > With the growth of number of repositories, it might be overwhelming t=
o
> > > someone who wants to set things up.
> > >
> > > I'd like to write up a directory that groups the repositories by
> > > purpose. I wasn't sure if this made sense, so I wanted early feedback
> > > before I started. The maintenance of it would be horrible for one
> > > person, but if someone wants their repository to have details and so
> > > on they can add it.
> > >
> > > I think it's important or useful to know what's out there and how
> > > things work together or don't, and what options there are for
> > > developers.
> > >
> >
> > +1 . Do you have a template in mind on how this could look like?
>
> I've been toying around with some ideas on how to organize the
> information. Grouping the subtrees together is a no-brainer, but many
> daemons don't really fit into a category. Maybe that's fine, maybe
> then it'd be uncategorized.
>
> I was imagining:
>
> {repository name}
> {short description}
> works with: {list of related pieces}
>
> for instance:
> """
> ### phosphor-hwmon
> phosphor-hwmon periodically reads and reports hwmon sensor values to dbus=
.
> works with: phosphor-host-ipmid
> """
>
> You don't need to run phosphor-host-ipmid to use phosphor-hwmon, and
> phosphor-pid-control and other daemons can also listen to sensor
> values or read them over dbus, so I don't know how complete such a
> list would need to be. So maybe the list should be less explicit. I
> realize that the recipes themselves reveal the true dependencies,
> either virtual or specific and I don't want to repost information. I
> just want to present a better interface to the set of repositories and
> how they work together (or don't) than github has.
>
> >
> > > Thoughts?
>
> I had the same idea from reading through the presentations recently linke=
d to on this mailing list.
>
> OpenBMC lists its features on its front page (https://github.com/openbmc/=
openbmc README) and suggests there is more information in https://github.co=
m/openbmc/docs.  However, the information is not structured as well as it c=
ould be for someone to learn about each feature.  I propose to list each fe=
ature along with the following information (as applicable):
>  - reference an external website or standard
>  - categorize: host-facing, management network facing, application
>  - explain terminology (give synonyms)
>  - explain 1 or 2 use cases
>  - link to the docs (which should explain customizations)
>  - link to the source code repo
>
> I would start with the features listed in openbmc/README, and add feature=
s (or interfaces?) from James's presentation:
>  - Host interfaces: KCS, BT, mbox, IPMB, USB, VGA
>  - Network Interfaces: Redfish, https, ssh, rmcp+
>  - Applications: EWS, KVM, IPMI, FSC, SEL, SOL, Chassis Control, ASD, Fir=
mware Update, Configuration Manager, Sensor Monitor

Makes sense to me.

Per the mailing list discussion yesterday on the hackathon, I'm also
starting to work on some "digging into openbmc coding" type docs.
That will probably deserve it's own directory?
- Getting Started: Dev env setup, hello world via SDK/QEMU, adding a
new system/layer, customizing webui and other items for new system,
bitbake using local repos, ...

>
> So, the proposal is to group repos by feature and interface.
>
> > >
> > > Patrick
> >
>

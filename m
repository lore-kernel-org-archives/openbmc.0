Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="W3gmnyyM"; 
 dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42Tbzj1N6PzF3BB
 for <openbmc@lists.ozlabs.org>; Tue,  9 Oct 2018 10:24:32 +1100 (AEDT)
Received: by mail-pl1-x62e.google.com with SMTP id p25-v6so10727117pli.11
 for <openbmc@lists.ozlabs.org>; Mon, 08 Oct 2018 16:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=Gn+cnOt/9mX+QquyNfLCA3qopK17ENs9aX/ClpikOfY=;
 b=W3gmnyyM2t4MyR2J4eXeyQe6YPsmTxxMGYeMnUZx4H3zC2a0bXlHMYE3XS1/cMk+vA
 F96KCBl++DnP7ekc759/AMBH/2iho/NmzEm+DsLxkbg4YEyM/PIqOsr7jy7sKtrFCgaK
 iZczjxacBiPNvASLURKRzdrJ5984AxCsH39S/dY2ji1ZklOFKnkcrd7XWWpY0ByMY1qp
 ASzNpxmeYtU8dMORdPBznaHAWretJ5C0SbQ2ALPSoFsYw894V84r7OCTw6oX1uIGD0xv
 fj0w9Qcd/zqH+xMrmK+XpNoz6bR3h/w7yfExEhhHCu7FICw8YPlDqpDTFnR6nNHiSOqP
 uxxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=Gn+cnOt/9mX+QquyNfLCA3qopK17ENs9aX/ClpikOfY=;
 b=AtWv1vWZ12wur2ieT82uekScXC/Iqkm84WLX0deNv3YAWZYJKWQYoveW2RUdYvcbzn
 pnK3qRbr5Jj/X1ra/jFfNPAp6mWZ0/ODfhq0+14Crvgb/t968OrHjuIQifDmM5TtmE2K
 voSmBL+ZLwZx66/vQXDyU/Y5NXyUnpst8Gfe3XBgmZ00B4He52G+Ydp6K0yQ/CQvxkz0
 urNUo10qAg4A81/Ne3QRJPkzpqDeCnOXdwX2V+gjMIA2eI4Dbfiwxfa4YKdLfqXjrAbc
 CPFT2mX1B127PW1Cwk/KEDW3kDbkU7tgpzczNyTECpw3NSPRqUOl4FDvipBTTUhtIYCi
 7w+g==
X-Gm-Message-State: ABuFfoia4RoM+CbvrEW3G5BMSV+jEK1u08flL2dyfUTiQS2pU50PSUii
 NpG0HUdXKS3rvh42euolyFTv37pHa3EiDqDUd7e5lA==
X-Google-Smtp-Source: ACcGV61b3NKeEAqibq82k8ruJBLgH5Y0/j9SztalweK1agrdx7GZxquxcWIDRwFz1q19hm5HTdAgNd6e61eXhHu1U3I=
X-Received: by 2002:a17:902:124:: with SMTP id
 33-v6mr26157860plb.205.1539041069603; 
 Mon, 08 Oct 2018 16:24:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notxnKj28mUG_GtN-7aBcQvdiO4RaTynGEe8Zc3awb31C5Q@mail.gmail.com>
 <OFB2E13EB3.61719782-ON00258320.00188DA9-00258320.0018D968@notes.na.collabserv.com>
 <CAO=notw=12OD1PRaOh1G7iWxgd-D_oU6FXy_Tyj5Gjnv2TFdww@mail.gmail.com>
 <OF52FCD065.2F4D9B00-ON00258320.00521B13-00258320.00525C58@notes.na.collabserv.com>
 <CAO=notyEVo_o+BazyRAvqBD6uW6QTj4azLBcOfutzuZ7=L8mPg@mail.gmail.com>
In-Reply-To: <CAO=notyEVo_o+BazyRAvqBD6uW6QTj4azLBcOfutzuZ7=L8mPg@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 8 Oct 2018 16:23:44 -0700
Message-ID: <CAO=notxBdVwRNTc2-tHQW_H+KTHBJTn64os9OnFRCeD2EQtJag@mail.gmail.com>
Subject: Re: In-band IPMI Update over IPMI Blobs
To: Sivas Srr <sivas.srr@in.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Mon, 08 Oct 2018 23:24:34 -0000

On Mon, Oct 8, 2018 at 4:23 PM Patrick Venture <venture@google.com> wrote:
>
> On Mon, Oct 8, 2018 at 7:59 AM Sivas Srr <sivas.srr@in.ibm.com> wrote:
> >
> > Yes Patrick, Would like to have Wiki for each function.
> >
> > And would like to see following in that:
> >
> >
> > Use case scenarios
> > Requirements
> > Design
> > Test Cases - Unit / Functional
>
> So which wiki should I use?
>
> >
> >
> >
> >
> >
> > ----- Original message -----
> > From: Patrick Venture <venture@google.com>
> > To: Sivas Srr <sivas.srr@in.ibm.com>
> > Cc:
> > Subject: Re: In-band IPMI Update over IPMI Blobs
> > Date: Mon, Oct 8, 2018 7:55 PM
> >
> > On Sun, Oct 7, 2018 at 9:31 PM Sivas Srr <sivas.srr@in.ibm.com> wrote:
> > >
> > > Nice Patrick, As discussed in test work group meeting,
> > > Shall we have this feature with identified
> > > Use case Scenarios -> Requirement -> Design -> Test cases
> > >
> > > Because code update is the feature which all end users will do at least once.
> > > We can have a wiki as IPMI Inband code update and then populate design over there.
> > > Once design is baselined, we can move it under presentations / document of github.
> > >
> > > Please let know your thoughts.
> >
> > I don't understand your email.  Are you saying there should be a wiki
> > where the design lives while it's under review?  Or are the test cases
> > going under the wiki?  And isn't it all under github?
> >
> > >
> > >
> > >
> > > ----- Original message -----
> > > From: Patrick Venture <venture@google.com>
> > > Sent by: "openbmc" <openbmc-bounces+sivas.srr=in.ibm.com@lists.ozlabs.org>
> > > To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
> > > Cc:
> > > Subject: In-band IPMI Update over IPMI Blobs
> > > Date: Fri, Oct 5, 2018 8:16 PM
> > >
> > > For those who have been watching, we have been upstreaming how we
> > > currently handle in-band updates over IPMI/LPC/PCI to
> > > phosphor-ipmi-flash.  However, recently we also upstreamed a generic
> > > blob interface, phosphor-ipmi-blobs.  Until
> > > https://gerrit.openbmc-project.xyz/13620 it wasn't a suitable
> > > mechanism for the firmware update due to an inability to do a clean
> > > method mapping between the protocols.
> > >
> > > I've written up a proposal (downstream for now) to port the
> > > phosphor-ipmi-flash implementation into a blob handler that just goes
> > > through phosphor-ipmi-blobs.  The thinking is to have more things
> > > leverage the generic blob handler instead of having a fully separate
> > > OEM IPMI command set for everything (although phosphor-ipmi-flash goes
> > > over the Firmware Netfn).
> > >
> > > It's now a pretty trivial transformation, and once the design has some
> > > age downstream (1-2 days :D), then I'm going to send it here for
> > > review.
> > >
> > > Unless there are obvious objections.
> > >
> > > And as food for thought, other Blob protocol use-cases in the works:
> > > - mechanism for downloading core dumps and crash logs over IPMI (no
> > > network access)
> > > - mechanism for sending commands down for special hardware
> > > - mechanism for reading back configuration files for whitelisted debug
> > > - mechanism for randomly creating large files such that the flash
> > > fills up and the system never boots again.
> > >
> > > Patrick
> > >
> > >
> > >
> >
> >
> >
+OpenBMC Maillist

Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="sO4aCZjK"; 
 dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43FMx63DqyzDqT8
 for <openbmc@lists.ozlabs.org>; Thu, 13 Dec 2018 03:40:09 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id z9so9130400pfi.2
 for <openbmc@lists.ozlabs.org>; Wed, 12 Dec 2018 08:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=suZievH5GzQKl3qNXhK4Ue5f3OpTZr0tsTu113eHEkE=;
 b=sO4aCZjKJUR8XQd9BHUoLKWAUF6gKVyBOQwDMf+Pc4xtSRSAbaK4b/La+iU2J0SEDk
 yHyjLujZznQ+GVw+0fdEkjgsj/VFnGvdCXp8kOeqxEIl7kjUz/B4Tz3Na5/E89Aols+A
 R4+37ys2vLuFUSM2vG1rAocsAYkGdCdq+sfMFGYDwbY3EPZ9g6pdpTysTxG4IJc19cZd
 JGAheyD/LWbmEX7VrD8T5MxlcGxWratrUk+Tj9is3Q6BZFD9hofGziHckxxVtzZ47Es3
 AO5KrCsrG/Ub3pVa2vVlle++v8NCeDtgtRe7UxcwObYsRsRzB4ommGQTXuEFb0TQFDSY
 sxeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=suZievH5GzQKl3qNXhK4Ue5f3OpTZr0tsTu113eHEkE=;
 b=QDUXj0XToX46tJ4PCPXN23MCr8yhgXgU7/oyyAHWZxyqWKCTVfOdMZfnQNkzfzG4ix
 xXN3JCe2QDkhm7vuY3scpwyb24qDExqC2iHJbvF5Jz7y/IRddgti3k67Ryz7xMoBFQqI
 jsXw31W890uxxpv/MeM6UZk2ApQI0owo4EFiG/UIsRe3gAFVWWydMfUPKSU8uKthkeU3
 LtdxiyhiAD19/PA31I3Ob/Cs222JoWqRgp2K6XB41roadMsmMauk2OkBY4v/z1ZFLsUd
 oKGrHWzJiOsT8iTxn8RvSCNr+o2NUUcdmv1TGk5qsJsv+7/TfXjqxYzPEZ3aeLL0zhYg
 KpBw==
X-Gm-Message-State: AA+aEWYWvIfujJeNfMTiZZrv+SSS7QC9ObRlAv4oh483gUcz2yADlfpw
 ZAGqZOkTjZYBFg/LExcbGMjd59kHGDsRr/1r/BVKuA==
X-Google-Smtp-Source: AFSGD/WtrVBQgfrP4WOIx253odvuSqvvURlluyDoeGH8cqYnb2dQoEPz+UUK+RWrGvElY2Ch41rX96oVuK/KgOjHH5k=
X-Received: by 2002:a63:4044:: with SMTP id n65mr18264961pga.90.1544632806814; 
 Wed, 12 Dec 2018 08:40:06 -0800 (PST)
MIME-Version: 1.0
References: <OF8448E3EF.7DB14623-ON00258360.004E1CA6-00258360.004E76F8@notes.na.collabserv.com>
In-Reply-To: <OF8448E3EF.7DB14623-ON00258360.004E1CA6-00258360.004E76F8@notes.na.collabserv.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 12 Dec 2018 08:39:55 -0800
Message-ID: <CAO=notzUUg2Zw3151uDtKcRx9DU4EnA5e-0Uxxu8zxi90SREJQ@mail.gmail.com>
Subject: Re: Fw: OpenBMC Test Work group meeting: - Webex link:
 https://ibm.webex.com/meet/sivas.srr Telephone access is: United States Toll
 Free 1-844-531-0958 (Toll - +1-669-234-1178) India Toll - 0(STD
 Code)-64800002 For eg. (Bengaluru - 080-64800002)
To: Sivas Srr <sivas.srr@in.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, kauvenka@in.ibm.com,
 adurgapr@in.ibm.com
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
X-List-Received-Date: Wed, 12 Dec 2018 16:40:12 -0000

On Tue, Dec 11, 2018 at 6:17 AM Sivas Srr <sivas.srr@in.ibm.com> wrote:
>
> Hi All,
>
>
> Lets meet one more time before new year on coming Thursday and at your fa=
vorite and convenient time.
>
> Test signup sheet: https://docs.google.com/spreadsheets/d/e/2PACX-1vSY9dO=
ODmvRSK1F9yOIxk1eeWWfItFfGrXirCHPYFGuSqVJQcmP6HPFudsq7gP33LC244UwB3y6KB0V/p=
ubhtml
>
> Agenda:
>
>
> Function Availability Check / Test Readiness:  ( Design with requirement =
/ use case availability, Design review, Test Plan, Test case identification=
)
> Update from global openbmc meeting
> Update from Release planning meeting
> any other agenda to discuss - if you have any pls let know or update it i=
n our wiki.
>
>
> With regards,
> Sivas
>
>
> ----- Original message -----
>
>
>
> OpenBMC Test Work group meeting: - Webex link: https://ibm.webex.com/meet=
/sivas.srr Telephone access is: United States Toll Free 1-844-531-0958 (Tol=
l - +1-669-234-1178) India Toll - 0(STD Code)-64800002 For eg. (Bengaluru -=
 080-64800002)
>
> Chair: Sivas Srr/India/IBM
> Delegated to:
> Send by:
> Comments from Sivas Srr:
> Time: Thu, Dec 13, 2018 10:00 PM - 11:00 PM (applies to 2 instances)
> Location: United States Toll Free 1-844-531-0958 (Toll - +1-669-234-1178)=
 India Toll - 0(STD Code)-64800002 For eg. (Bengaluru - 080-64800002) Passc=
ode: 928 662 307
> Room:
> Resource:
> Online Meeting name: OpenBMC Test Group meeting
> Online meeting: https://ibm.webex.com/meet/sivas.srr
> Meeting ID: 928 662 307
> Password: sivas
> Required:
> Andrew Geissler/Austin/IBM, anup.pandya@intel.com, Arpana M Durgaprasad/I=
ndia/IBM, benjaminfair@google.com, bradleyb@fuzziesquirrel.com, Deepak Kodi=
halli/India/IBM, ed.tanous@intel.com, George Keishing/India/IBM, Joseph Rey=
nolds/Rochester/Contr/IBM, Kaushik Venkatesh/India/IBM, kurt.r.taylor@gmail=
.com, Maury Zipse/Rochester/IBM, Michael Walsh/Rochester/IBM, rahulmaheshwa=
ri01@gmail.com, Ravindra S Rao1/India/IBM, venture@google.com, yuenn@google=
.com
> Optional:
>
> FYI:
>
> Description:
> Note: Rescheduling this meeting to accommodate new members.
>
> General Agenda:
>
> - Recap of last instance and solution
> - New Agenda / Issues to be discussed - planned earlier
> -  Around the room
> https://github.com/openbmc/openbmc/wiki/Test-work-group
>
> Agenda: 23 Aug 2018
>
>
> New member introduction if any
> Auto test plan generation using robot framework ( https://github.com/open=
bmc/openbmc-test-automation/blob/master/tools/generate_test_document )
> Do we need to create explicit test plan document?
> Dynamic CI discussion

I'm resigning from the OpenBMC test working group.  I haven't been
able to attend lately due to other obligations, and I can foresee that
this will continue to be true.

- Patrick

>
>
>
>

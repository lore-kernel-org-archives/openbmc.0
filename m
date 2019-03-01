Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::130; helo=mail-it1-x130.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Wzvojvm3"; 
 dkim-atps=neutral
Received: from mail-it1-x130.google.com (mail-it1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 449Y0s2YzyzDqHj
 for <openbmc@lists.ozlabs.org>; Fri,  1 Mar 2019 13:15:24 +1100 (AEDT)
Received: by mail-it1-x130.google.com with SMTP id l15so19073386iti.4
 for <openbmc@lists.ozlabs.org>; Thu, 28 Feb 2019 18:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4Bntw+UFAUju9NBxHTzUI3FcaSZXcPtv4GEZBnS5EzQ=;
 b=Wzvojvm3ccP+4KuMR32lZS90xnN6SjHJTz/E2ILeHH6Bk9aw+Iqj1by40oN3HNzNFs
 CcnO9hVxycUDYCd3cIekFHTwtMRzWQbBlmae7u/feBTkrX+J1Ov2wDwlP996Hv+967WK
 BxR/o59MGR/m3O3k38jqkzV0tnL2dEa5xsaQoXDT8sEyUKsJQ20vMRER5Y4Kacg8cQuH
 EX8Y8m3P6phUPNmbaMA4jqAS4OnoNasE+jIhBf45bICFl4WDxFt29Jgre7LHzf8ORT3i
 Uav65PqGkJ+3qP/jZVyopUSRzgg7wA6D8K6Y+XHCbzztCuXk1uhWAHIluAeMvjWCTV1w
 U6Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4Bntw+UFAUju9NBxHTzUI3FcaSZXcPtv4GEZBnS5EzQ=;
 b=f1wMuWiQY6HTRuFwgkdpNgC4fm1C4vm1DyMsryTzbGl94qPLPG+yMjBvHRwtBu92sZ
 bsr+6kviH7CJaJe2aXpWWEGhoVLpAEC3ntovK7HVoD/k21p0+ATQLgY8nDiz1yCt86gq
 iOKeRcDwQlkgTDG0gY+cv2UXdNI53CzsRc1kTS0BB8J0B/yQB/Cbmm0RlNWGmdXO8+Zp
 TPld3no8BGpWzSkiInlHX/50Y5BEtxeaPLR1altUgoCzMnYEiH5iyjvaL0haWj4nUDB+
 VPN9Xr5urAJ1O19XhukmjJB2T/yIGqKEyqUKuvMUSlvNnhWljkXldnc71VxSiiyGuCUs
 pVEw==
X-Gm-Message-State: APjAAAVLAXOs+HskkDeOM4YeYXg6p6NEKP1vwQsf6kR0OIuCGR2WE5Os
 nusC5XBpiUtv8J5B2lDhTOlqRoTj+HUcd1m0V6E=
X-Google-Smtp-Source: AHgI3IYz4D0SthLcMKiFbUFtNK6eRzQPHEYGIPOIVgRT1pNdZ+R/3N/wWP5ueZFBIQ8GxUbjbJ9/BSLxCIjqUWQ41Ug=
X-Received: by 2002:a24:5f4d:: with SMTP id r74mr1785531itb.178.1551406521368; 
 Thu, 28 Feb 2019 18:15:21 -0800 (PST)
MIME-Version: 1.0
References: <CAMTupoSj09Tq=1hfdEsQBJi_aO=TVY00Qs1CC3zrmZP2R-o2FQ@mail.gmail.com>
In-Reply-To: <CAMTupoSj09Tq=1hfdEsQBJi_aO=TVY00Qs1CC3zrmZP2R-o2FQ@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Fri, 1 Mar 2019 10:15:03 +0800
Message-ID: <CAARXrt=ebgO7sPOWJa_XUR48qcX+K74kTEqz=iNSd46kALjtyw@mail.gmail.com>
Subject: Re: NTP Servers - Should a reboot be required?
To: ja az <jandraara@gmail.com>, vishwa <vishwa@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 01 Mar 2019 02:15:26 -0000

On Fri, Mar 1, 2019 at 6:19 AM ja az <jandraara@gmail.com> wrote:
>
> Hi all,
>
> During the Demo and Retrospective call last week, the UI design team
> showed the current proposals for the Date and Time Settings panels. As
> it stands, the backend has been developed in way such that any changes
> in the synchronized NTP servers would require the host to be off in
> order for the changes to go into effect. If the host is not off, a
> reboot is required. And so, the UI designs were created to represent
> this. When they were shown last week, there was hesitation regarding
> the need for a reboot; some gave the example of changing the date on
> their laptop and how that doesn=E2=80=99t require a reboot.
>
> Are there resources to modify the backend so that a reboot is not
> required? Is that possible even if there were resources?

This is really a good question.
In OpenBMC's time manager, a requirement is that time setting changes shall
not be applied until host is off, see [special-note-on-host-on][1]

@Vishwa could you kindly help to describe the reason (or history) of the
requirement?

[1]: https://github.com/openbmc/phosphor-time-manager#special-note-on-host-=
on

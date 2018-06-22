Return-Path: <james.mihm@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4002:c09::229; helo=mail-yb0-x229.google.com;
 envelope-from=james.mihm@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ceqO7CVh"; 
 dkim-atps=neutral
Received: from mail-yb0-x229.google.com (mail-yb0-x229.google.com
 [IPv6:2607:f8b0:4002:c09::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41CF6b2X57zF13F
 for <openbmc@lists.ozlabs.org>; Sat, 23 Jun 2018 09:25:27 +1000 (AEST)
Received: by mail-yb0-x229.google.com with SMTP id x128-v6so3139105ybg.3
 for <openbmc@lists.ozlabs.org>; Fri, 22 Jun 2018 16:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QtpRzekf0Sm0iGdvwkAENzJlzXr8B9D3y0BdR5dbxO8=;
 b=ceqO7CVhpVJEft7RdutFJ9EqCfipvb5A/23Q/s2kKgRSAwKBSctDNb6ln0WxCryjaU
 epxgrJZhqGwnSa2hPpJDMeFVzPc/bhz2M1LQF36IiRdHDgzpnIqxK9YEMrBO0lc6KwgO
 zMuKoa9C0tLKQ84dC+3pWuDSbH3BOZkrmVNcS5fNzztMzACq8NbahtwvkvaY6YIeJ4y9
 fNFzWnqzvQCXyhM+uEMd1rY/e/D631en3wogSFCTpjgg+DWbPZYlKKDOoh1X/uampTin
 JqjH2bOtx2xynGbUsmMvvXLbOoR6OEtst4EkR46UUp3xlGxJYByCWK32oLc3lqUuGw1/
 tCzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QtpRzekf0Sm0iGdvwkAENzJlzXr8B9D3y0BdR5dbxO8=;
 b=OD+9TZ5M+XT9M0w10xNzos2vgBUQ40uXULWlmFtc3U++m6xWj19eiJXegNSbdvkvWs
 FEgDdfsW9CUmgI4Hx7xuEduvvanfQe3i/TLUzr8PyCb2CFpoe7QNR9YLJoAkzizSFLcF
 fyTkoUgduSCNG7TFUSTZjQpPgPUINzRaE1A7+Na4k/N0jzN7jprKhiyn4ZcUVShIOApa
 HBu7HbNgNcGYUhueu+iAfcePmYA+J+10C9M99htBcXMGcziH/+jLF9/iHmB294h2epOc
 vnMDMeQzoLXeL1hln0EWBGUs4Ihz7PSQgDMDJ1G+5XeA+3GlmwhwdcsHx201iApIRKPC
 +/Hw==
X-Gm-Message-State: APt69E12fDJ+n0MGpgbvj/yRU2DG6B38pcYa16i4M9MP4YaPPQW4BlAr
 aVJfUsVSqwKvbdibw0LL+yU4LA7GliphofNKKN8=
X-Google-Smtp-Source: ADUXVKIUKYwfI93GHx+jmTTw1ztSbv6a4z7eFhglMUnwdQ8oUfl62sRvUPjKegJ3sOfX9L5XObwZ/NUY7ERBYkyWUL0=
X-Received: by 2002:a25:8211:: with SMTP id
 q17-v6mr1898754ybk.414.1529709924608; 
 Fri, 22 Jun 2018 16:25:24 -0700 (PDT)
MIME-Version: 1.0
References: <f86c688b-b237-bdd5-12a0-385f96902581@gmail.com>
In-Reply-To: <f86c688b-b237-bdd5-12a0-385f96902581@gmail.com>
From: James Mihm <james.mihm@gmail.com>
Date: Fri, 22 Jun 2018 16:24:48 -0700
Message-ID: <CADy_Pt1f5Fom5H_TO-sgE_Lx=wu9KJLG0qR3pF81rrihkzKgSA@mail.gmail.com>
Subject: Re: OpenBMC Release Planning Working Group
To: krtaylor <kurt.r.taylor@gmail.com>
Cc: openbmc@lists.ozlabs.org, alirhas@microsoft.com, 
 Brad Bishop <bradleyb@fuzziesquirrel.com>, "Mihm, James" <james.mihm@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Jun 2018 23:25:28 -0000

My vote is for the 2pm or 3pm slots.

1) Tuesdays, 2:00pm Central US (1900 UTC)
  - or -
3) Thursdays, 3:00pm Central US (2000 UTC)
On Thu, Jun 21, 2018 at 12:08 PM krtaylor <kurt.r.taylor@gmail.com> wrote:
>
> Hi all,
>
> The long anticipated OpenBMC Release Planning working group is now
> forming and will have its first meeting next week. I would like to keep
> the meeting small at first so that we can move quickly, but I do need
> complete representation. Please let me know if you'd like to participate
> and what day a meeting would work best for you. Those on copy should
> plan on attending or at least make sure someone is covering for your
> organization.
>
> Let me know if you have any questions.
>
> Regards, Kurt Taylor (krtaylor)
>
>
> Proposed times:
>
> 1) Tuesdays, 2:00pm Central US (1900 UTC)
>
> 2) Thursdays, 8:00am Central US (1300 UTC)
>
> 3) Thursdays, 3:00pm Central US (2000 UTC)
>
>
> Initial Agenda:
>
> 1) Agree on the release process and set an initial release date in
> November (see email from May 21)
>
> 2) Set design and freeze milestones
>
> 3) "Must" deliver items for November release
>
> 4) How to open the design and development for a needed feature
>

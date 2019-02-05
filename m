Return-Path: <teddy.reed@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::32d; helo=mail-ot1-x32d.google.com;
 envelope-from=teddy.reed@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Es5YAqJ5"; 
 dkim-atps=neutral
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43v7DL56mYzDqMB
 for <openbmc@lists.ozlabs.org>; Wed,  6 Feb 2019 02:05:19 +1100 (AEDT)
Received: by mail-ot1-x32d.google.com with SMTP id 32so6081968ota.12
 for <openbmc@lists.ozlabs.org>; Tue, 05 Feb 2019 07:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I14IliA5ZbC/64XGNYKwapBSaqlAyroYJ/3MFG8jnvo=;
 b=Es5YAqJ5WMa/S8kmyDefYlNwzkk51KdUdO/s1OIe4KOotK3iWajfrv9Xi+MWQ4+H9i
 LRSPC2maVycyvZjGzQ7RFvV2AM1G03z5faWNh0fcn7VHnfQO6OTy8W2L1/SDCsZc4Lvv
 yuVg9iXTO8xBFCooAoWEkymIV1a0GiJNPtY1XP0ZR5ER7JXizRrnyIIDrIjMtSIwNc29
 DZBfqAIneob9Ychg2H8PMVugqVlJy0kCGlSCoR9s+W5xUbqvI3QwioUcxW04tyGrzsKt
 +Ty/7sBNXbbH4FfvDCiq6hOzNtQ4nQxD3li7xXgXVpl/d/uvnSf0fErk0UGcBWy9PQqd
 pbgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I14IliA5ZbC/64XGNYKwapBSaqlAyroYJ/3MFG8jnvo=;
 b=VwbLJbCZg0eoKrjcgIT2CIZqKYKMCyLdOoy66kmO0PhYsRCMG/KCuUYa8rygFNMBhY
 AL4avbvW/OSlUGNqILmY5pLeuU4dd0wsixByBl3GcLkgBBEZTYe2b2X7Eh68EAztbZfQ
 LObkQmP4FnkcvXXGlxsvObDOLsNpvVnWL/uPULe+aUJWUANraHtDOH9RyCGhoEXeuKhl
 Qw1KwggclHi1ku0s+8EDQtP6IFznwnJ5rYPwGm1JJtYYyOdIG8edwVYi35pQ7RU+7Suz
 2WegLLe0gumAX6HPIAJQOv58PJ9PLIuCT0ce/+MFPINtqnOa8XrdN180+vccsfOalpje
 EDZw==
X-Gm-Message-State: AHQUAuY3hB0sg+x/W+gZnS3lz/ejUjJCAC6ynJAL6T4iLvmjdgjRxW0m
 aTeBsi3f+MZkNVKVYCbzu6J6G4hZ
X-Google-Smtp-Source: AHgI3IboUwotFeRAkenBN/dUWRJJLZxPGYwdwcrOsxZID3PjEgi5WNFgn3br/vDsAXO0fEznBAfVLQ==
X-Received: by 2002:a9d:42c:: with SMTP id 41mr2990400otc.41.1549379117453;
 Tue, 05 Feb 2019 07:05:17 -0800 (PST)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com.
 [209.85.210.53])
 by smtp.gmail.com with ESMTPSA id s186sm8591618oif.0.2019.02.05.07.05.16
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 05 Feb 2019 07:05:16 -0800 (PST)
Received: by mail-ot1-f53.google.com with SMTP id 32so6081801ota.12
 for <openbmc@lists.ozlabs.org>; Tue, 05 Feb 2019 07:05:16 -0800 (PST)
X-Received: by 2002:aca:6c04:: with SMTP id h4mr2850648oic.10.1549379116178;
 Tue, 05 Feb 2019 07:05:16 -0800 (PST)
MIME-Version: 1.0
References: <20190205141403.y2yno3nmxvwgd6ex@thinkpad>
In-Reply-To: <20190205141403.y2yno3nmxvwgd6ex@thinkpad>
From: Teddy Reed <teddy.reed@gmail.com>
Date: Tue, 5 Feb 2019 10:05:04 -0500
X-Gmail-Original-Message-ID: <CADUykepJuOzKK231huZ5McghtpNNizSi6XJYzpz9ZNFLhkY5fQ@mail.gmail.com>
Message-ID: <CADUykepJuOzKK231huZ5McghtpNNizSi6XJYzpz9ZNFLhkY5fQ@mail.gmail.com>
Subject: Re: Secure boot for BMC
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 05 Feb 2019 15:05:23 -0000

Hi Brad,

We added a verified-boot implementation to Facebook's flavor a few
years ago, based on U-boot's and Chromium's designs. It is not well
documented publically but you can see the unit and cont-build test
harnesses here:
https://github.com/facebook/openbmc/tree/helium/tests/verified-boot

I'm happy to collaborate on future designs. At the very least I could
provide lessons learned and potential improvements. Amithash and Sai
could provide valuable input too.
-Teddy


On Tue, Feb 5, 2019 at 9:14 AM Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
>
> Hi everyone
>
> Does anyone have plans to provide a secure BMC boot implementation to
> OpenBMC in the 2.7 or 2.8 timeframe?  Just trying to get a feel for who
> all wants to collaborate on this before I submit a design template.
>
> thx - brad



--
Teddy Reed V

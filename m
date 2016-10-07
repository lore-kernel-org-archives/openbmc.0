Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3srCLd64kbzDrPL
 for <openbmc@lists.ozlabs.org>; Sat,  8 Oct 2016 01:58:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=dexqfKgh; 
 dkim-atps=neutral
Received: by mail-oi0-x242.google.com with SMTP id d132so3511272oib.2
 for <openbmc@lists.ozlabs.org>; Fri, 07 Oct 2016 07:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=UGG20Tcd5RRD0EOuzXdU7iIRvk3b3Zg4W5zx1cP1SBA=;
 b=dexqfKghGxnxiYQ/zO8NzWZWn2isAF5GtGMx3n2R3yJHaA9sD4rVleS254xjTt7qDN
 5jcnrwrjTJih4dz2rOCJAKoiUL3ZP6e+N9R1K7z86E6Do+/5KbBPFiW1Avkwl04TW2hK
 oXMLQnMAZ5Laqxf5BxGL2HbICwLHghgWlx4GN10bhV/Ora3VZ3P1kTF56UiHDmzECDal
 fmY4G+/ojwTDlL3dFDsO6WhRCV4Onw9lUPK+H4nifhff6iourFum9J/4hCq5z5ypWBDG
 6ILmovWUMXemsEBEPaJp7C7454nEYDPaK7u5DiA28jm/B8RlyZVbUY/9Bpr64Nc9j6OB
 JowA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=UGG20Tcd5RRD0EOuzXdU7iIRvk3b3Zg4W5zx1cP1SBA=;
 b=cJ2xqBTfdlhw+DrR+l0dttOEY6WAbrWbYuW9AQVOcR7clNeHsayw2PR9BeAuUnsT0S
 21K91eWK/dfW/D22HHOQVBgb+BycBJT/ib4gZLn8RgUZMs1VER1wki5f110F8e8EG2AA
 AOcO9I6qQNUjubHgLc/gfjXRilnY87L0V/ifK6Zk5Un/W/47qyRiMPtHpOjHVYgVrTbs
 F+5/iZmak9aKmqNSXw+Ds6SMjF3VzRdLNDXtKikNGjRvMUVgJ5FX1er8HjDDdXHCQpDv
 sgsTEvG96h7lAqwj/mtj13gFBP9JCbqV0aqCMlklJYGejQ65Bc8BkQQr7iVEZjO8dUPl
 VmzQ==
X-Gm-Message-State: AA6/9RnFkB7JwL/dShL7CWieo7ztQjbhJ7CwiLuz7GKwRasT/QZEue9mOmqf3pkl/U9aDHOParMeji/hFbGSpw==
X-Received: by 10.157.6.45 with SMTP id 42mr13001499otn.100.1475852278682;
 Fri, 07 Oct 2016 07:57:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.220.132 with HTTP; Fri, 7 Oct 2016 07:57:58 -0700 (PDT)
In-Reply-To: <7611055b-b2d6-b461-7b0f-f672b577cdc7@ozlabs.org>
References: <1475700868-75737-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1475700868-75737-16-git-send-email-christopher.lee.bostic@gmail.com>
 <428264fa-63bf-23a3-0a54-7acf0f3585ad@ozlabs.org>
 <CAA0LjjVtq-Mdo7zz7Aim_1Xcn_tG-PqfrEnzWgi50aYcg_S-eA@mail.gmail.com>
 <7611055b-b2d6-b461-7b0f-f672b577cdc7@ozlabs.org>
From: Christopher Bostic <christopher.lee.bostic@gmail.com>
Date: Fri, 7 Oct 2016 09:57:58 -0500
Message-ID: <CAA0LjjW2mW3iiymQFs70VDCsqzMb07NJfZc3xCaTD_qB-aiU2A@mail.gmail.com>
Subject: Re: [PATCH linux 15/15] drivers/fsi: Initialize CFAMs for read/write
 access
To: Jeremy Kerr <jk@ozlabs.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, xxpetri@de.ibm.com,
 zahrens@us.ibm.com
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Oct 2016 14:58:03 -0000

On Thu, Oct 6, 2016 at 8:21 PM, Jeremy Kerr <jk@ozlabs.org> wrote:
> Hi Chris,
>
>> A break can be issued on any available link.
>
> OK.
>
>> Due to hardware bugs that vary depending on the combination of
>> master type and cfam type the break command must be issued to
>> different ID's and addresses accordingly.  This was the reason for
>> adding the cfam_id, break_id, etc.. to the fsi_master struct.
>
> But (according to the docs I have) a break is just a logical 1 for 256
> clocks - it contains no addressing ID / information. What do the
> cfam_ids and break_ids represent "on the wire"?

Right, at the protocol level a break is simply 256 1's.   One of the
cascaded masters on P8,P9 though has quirks where you must
adjust the target address and ID when writing to the actual hardware.
I don't know the hardware specifics as to what the bug is but
the logic responsible for the translation of a firmware initiated MMIO
onto a link that results in the 256 1's has a bug that corrupts that
message in some way.  Note that this is even an issue for the gpio
master since the bug I just described is in the P8,P9 cascaded master
hardware.

Sounds like we need  to schedule a meeting to probably
go over all the hardware quirks that need to be dealt with.  Exchanging
emails probably isn't the quickest way.

Long story short we'll still need a master->break( ) operation defined
for each master type.

-Chris

>
> Cheers,
>
>
> Jeremy

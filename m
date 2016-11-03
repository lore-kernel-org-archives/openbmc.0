Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x22a.google.com (mail-oi0-x22a.google.com
 [IPv6:2607:f8b0:4003:c06::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t8Zck6WRnzDq8M
 for <openbmc@lists.ozlabs.org>; Thu,  3 Nov 2016 17:21:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=iDyYm3uk; 
 dkim-atps=neutral
Received: by mail-oi0-x22a.google.com with SMTP id v84so66285030oie.3
 for <openbmc@lists.ozlabs.org>; Wed, 02 Nov 2016 23:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to; bh=WjUZN3UwlOlrUFa6sU/jqgBD0QkyuiNMWRLpdc/fGjo=;
 b=iDyYm3uki6HHNdEUk0CovTP2RcnQ7136Nr9+Dhw2Ml8rGxAn8tOOhhVIJBoGSdwlOW
 2JzDMnlKLOikwpM8CIPM6pAxHNbIZQZINrxMhVns4znbTcLa3NCw3Brc4uhNdnS/lz9x
 4E9gMFZmZyA7Z0mjgWvUJyFWGPxqFBSNSAUyOVRYPAG1xHsw1Obt8DNk8FNZrly6Tnm6
 VT6GaqUSISxZur+IWeu2YQWQ8NiF+89ARov08DX1Hl9VgqckwCSN2kaER0jdLgyqK4JH
 9WAm98wpns6c4O9kvnO9NSQdcuSMKbEJYJjZXd5k9UcL7bo/PIIQNeM5rfVGTMZIwLD9
 MMXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to;
 bh=WjUZN3UwlOlrUFa6sU/jqgBD0QkyuiNMWRLpdc/fGjo=;
 b=XbPTI40Yu2XNmV6rhjvC9yIH2Cjy106f4IqDEecJQn/b4Bh6Stfoh59ingDm7BNs4i
 34sd+grDxLTCH4qyUTw7R7POzDjHGB0OPSP2cPXy2PDtVm//RddeEwYjj3S1QyHLVI7W
 nOIqeThwDNO8kle2z82MZX8xBV3rMx4weetRwyf+0zdUa6ekp2SXR4XfsPFRyggdcMqD
 Y4QOZQbWfu7MV3M7cIeL1Jh++PQOphrmYkQDeiAJFBNpJHYPsBHKZH3+IPNRtKGbwWkP
 Ivt8wX2f/w29g7Yz9sE+L58RSrQutn1GL7tB37px306RinuTm6gkyAroNzsmSwYwX3pY
 af7w==
X-Gm-Message-State: ABUngvc/sZ22tHSWxr7Y3b4cdNIsRi4/fHkJ38OQ+kHGo6hBsPRikRRPRuEXEjCLeHWRZfN15rPu4yDivB/Jfg==
X-Received: by 10.157.22.200 with SMTP id s8mr4663828ots.14.1478154116650;
 Wed, 02 Nov 2016 23:21:56 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.107.226 with HTTP; Wed, 2 Nov 2016 23:21:36 -0700 (PDT)
In-Reply-To: <CACPK8Xcyic3BsnxTLx8c5p-=34xqrfDTZ4bFKa309hCSZPuhAw@mail.gmail.com>
References: <CACPK8Xcyic3BsnxTLx8c5p-=34xqrfDTZ4bFKa309hCSZPuhAw@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 3 Nov 2016 16:51:36 +1030
X-Google-Sender-Auth: ewC_vtLvjGMWBtMlC1r9B7RorSg
Message-ID: <CACPK8Xf8=uCE3tSrUMtELgYsky6Br5b14BxL3DdH-XTk7ntzGg@mail.gmail.com>
Subject: Re: op-flasher changes
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 03 Nov 2016 06:21:59 -0000

On Thu, Nov 3, 2016 at 1:09 PM, Joel Stanley <joel@jms.id.au> wrote:
> This requires some testing. I have a tree that updates the version of
> skeleton we use to include the first set of patches here:
>
>   https://github.com/shenki/openbmc/tree/flasher-cleanups

I tested this tree on a Palmetto by using rest to update the PNOR. It
looks like it succeeded:

Nov 03 06:11:10 palmetto download_manager.py[668]: Downloading:
palmetto.pnor from 10.61.2.7
Nov 03 06:11:10 palmetto phosphor-gevent[782]:
::c063:abb6:8e91:f402%1230014792 - - [2016-11-03 06:11:10] "POST
/org/openbmc/control/flash/bios/action/updateViaTftp HTTP/1.1" 200 169
0.257042
Nov 03 06:12:00 palmetto flash_bios.exe[710]: Starting flasher:
bios,/tmp/palmetto.pnor,/org/openbmc/control/flash/bios,
Nov 03 06:12:00 palmetto flash_bios.exe[710]: flasher:
/tmp/palmetto.pnor, BMC = 1, address = 0x0
Nov 03 06:12:00 palmetto flash_bios.exe[710]: Setting up flash
Nov 03 06:13:24 palmetto phosphor-gevent[782]:
::c063:abb6:8e91:f402%1230014792 - - [2016-11-03 06:13:24] "GET
/org/openbmc/control/flash/bios HTTP/1.1" 200 383 0.080871
Nov 03 06:13:54 palmetto phosphor-gevent[782]:
::c063:abb6:8e91:f402%1230014792 - - [2016-11-03 06:13:54] "GET
/org/openbmc/control/flash/bios HTTP/1.1" 200 383 0.082777
Nov 03 06:15:04 palmetto flash_bios.exe[710]: Erasing... (may take a
while !) done !
Nov 03 06:15:04 palmetto flash_bios.exe[710]: About to program
"/tmp/palmetto.pnor" at 0x00000000..0x02000000 !
Nov 03 06:15:04 palmetto flash_bios.exe[710]: Programming & Verifying...
Nov 03 06:15:04 palmetto flash_bios.exe[710]: Flash done
Nov 03 06:19:25 palmetto systemd[1]: Starting Cleanup of Temporary
Directories...
Nov 03 06:19:25 palmetto systemd[1]: Started Cleanup of Temporary Directories.

Cheers,

Joel

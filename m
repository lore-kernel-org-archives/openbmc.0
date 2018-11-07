Return-Path: <beccabroek@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::b2c; helo=mail-yb1-xb2c.google.com;
 envelope-from=beccabroek@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="dIgTKB7M"; 
 dkim-atps=neutral
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42qtqt6qskzF3JW
 for <openbmc@lists.ozlabs.org>; Thu,  8 Nov 2018 04:36:07 +1100 (AEDT)
Received: by mail-yb1-xb2c.google.com with SMTP id p144-v6so7153770yba.11
 for <openbmc@lists.ozlabs.org>; Wed, 07 Nov 2018 09:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=6ROUWSb0xcYHmwHcu1GKzMmPxqJ95AF83axn1y4yLDY=;
 b=dIgTKB7MP/Q6uBHHGCs/zfpUbzYip/BHFjuUajoOwpiL/2GiGecVvjVeGg6P6D42/N
 vDkuL426R6g54J9PUlVAFsDOQsOB+nHXaU5Y2z8x4TP3XKbGcqt7gF0DdEddaB0a+piY
 l1f8nm/zWuPu9JEFmesu6QYkIrre3l3MGX1THdQScj9KW2pPnFjFxBjJh7w35MjUAPqK
 sQZjH63exhLmKQco3RGTFrn7OQWMnL84sgBQ2tWt6HFkDPpyrVSnTX1St41Aiz/EdW2h
 4CsxpM339jM2z9RibQ15yv5+4eYs+KD0SbC6uhJ39Qz9TlG8oKjo6RqdMO/GIStJceYn
 IlYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=6ROUWSb0xcYHmwHcu1GKzMmPxqJ95AF83axn1y4yLDY=;
 b=owDTE9cbNu/XrYq56HwUyq+VE7ae2dNixF1WYjBpT4CvSDwZRqqGaYOG109fffGeeN
 gAq2KNt63GpqaRXlmjm7v5m2O7OZG9HkHEKhTF+6mKhfdR/7qf6X/0YRZGnHKN3Vyd2l
 Phfc82zcV2l3/OXxxe73fQE+G2vShBvOA1aW5teIkuPuBhVF3O0TgcsjJS0XPfIAh/NN
 uzya9A1rq62EPk42Ccu88P42Bt1SvbYkFUog3IJ/zaA04262bmXiJg1rFkL0DFcXu7QM
 Y3kAW6fp++0XYCfgVeGQB+ZJdz+C334BnVU9PUl3dmtGblXrnfcr4B/JxkxnAQ/dcVIP
 1uMg==
X-Gm-Message-State: AGRZ1gKmz+C6l0ORrbMwFytxYJmLepuwjsisdE+YQaOI1DgF9b4N366A
 Yc0yNRuh1SLSeXdT7kkfW3ukVxKiwb0PYK66cvvKi1G5
X-Google-Smtp-Source: AJdET5cJ0NfvIhhwnZxDb5BGDfcXrHeeHXYp3r/jvoW0OZzZh1ER907XRi1ozI5oRetxuaAR4xjCu8pf5Am8GOLCfnM=
X-Received: by 2002:a25:348b:: with SMTP id
 b133-v6mr1204151yba.269.1541612165180; 
 Wed, 07 Nov 2018 09:36:05 -0800 (PST)
MIME-Version: 1.0
From: Rebecca Broekhuis <beccabroek@gmail.com>
Date: Wed, 7 Nov 2018 11:35:54 -0600
Message-ID: <CABzWfrnktcYsrMoNAmBrVHMCXGacFBMWRE=Ubz+NUU5bhMkrXw@mail.gmail.com>
Subject: Exposing LDAP groups via REST
To: openbmc@lists.ozlabs.org
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
X-List-Received-Date: Wed, 07 Nov 2018 17:36:11 -0000

Hi community,
I want to discuss a feature the front end team is hoping to find a way
to implement for LDAP configuration in the GUI. It raises some
security questions and I'm hoping for input. When adding a privilege
mapping (associating a LDAP role group with a privilege on the BMC)
via the GUI, the user needs to enter the group name as it is
configured on the LDAP server and the privilege that should be given
to this group. The GUI is able to provide a drop down of the available
privileges for the user to select, but the role group name must be
typed in. The challenge with this is that there is no confirmation
that the LDAP group name the user entered is valid besides trying to
perform actions as an LDAP user in the group after it is configured.

Working with the design team here at IBM, it was brought up that it
would be ideal (from a usability perspective) for the user to have a
drop down of the available LDAP groups. This would require using the
stored LDAP configuration in the back end to query for a list of
groups to display to the user.

As this would be the first instance in which we're doing something
like this with LDAP (using the given configuration to query the LDAP
server and display something to the user), it raises a couple of
questions:

1. Should there be an endpoint that allows retrieving information from
the LDAP server like this?
2. If so, who should be able to access?
Any input would be appreciated!

--Becca Shaw

Return-Path: <geissonator@gmail.com>
Received: from mail-it0-x232.google.com (mail-it0-x232.google.com
 [IPv6:2607:f8b0:4001:c0b::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vRykd6vLtzDqHV
 for <openbmc@lists.ozlabs.org>; Tue, 21 Feb 2017 09:20:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="q7HG9h4G"; 
 dkim-atps=neutral
Received: by mail-it0-x232.google.com with SMTP id y135so31778614itc.1
 for <openbmc@lists.ozlabs.org>; Mon, 20 Feb 2017 14:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=qJ2ckqdlQhrSMauAlF90AUcdXOUgDb38hLmXaacX2zk=;
 b=q7HG9h4GqYYCjijxPMk/z4kLrUcbXmahmpdIYskHsfiiFPUiwx9nSV97X4nhMDnIol
 bBz+5yvBosPvB5ayoAdDEuv0hepwoIb7P2cpyjbTF1zu7Qr/DQwiB+2dyGH3s/XMPzkK
 C+gD+1KVygFWMZDMUrGTis2QOcDJblIoOq+FJpKRpfC8fyxvPesZ1yAkNAZKrZn1pRzQ
 7eBeSzjuJ3t82fVat5FnrBH5mdB7MXZCaQWqsGiEcm4tnRCVLsJ5WOWpxinAasP5uiKw
 ULbKaHJrZq2aXuDDeSKUCL2xWOgBAn1ZCsEx6kehMLPVb/7VbVZxgL+X2mzlpNlXj7vT
 OMrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=qJ2ckqdlQhrSMauAlF90AUcdXOUgDb38hLmXaacX2zk=;
 b=EhX3UwBGu+P1SNzU5LuRrj14kbhOlUVcH/UwOYg2re1xca8qeZa7VVfpcwYewaFjCi
 TRX0tOXOD8nR3qUmEjnyBK+6vvpId8ymohrJPnpYL68MnPrxr2vBXjeZ738pkVBxM7Jm
 S8GSDGWcYW3dfp09SelqmQSHLfXhaEpm7xLWBXVcOU3zI3CkSS8fhwEGCzFbREVIU9hz
 yEhMSlJT2Dcw2SL2oErCQjjxhIDgyECnKGpzo0nqZtcTO9Q2zXFX40ZeRSlsJ5NznThw
 orc49dnzF7g1GMA9yF4svMM5EMPe/5Ncv6LqbxiRxIGaWNrtK8v2OTBBugdQSg0eY2Q6
 mj9Q==
X-Gm-Message-State: AMke39nfvt+Oq/J0pcnOe8NylbDlg3/DqlwKjypcsT/4PiTX0H5G+vqYAY6iGoDzIoo5Vd5phakytW7Fwp8cnw==
X-Received: by 10.36.85.196 with SMTP id e187mr13894896itb.33.1487629239831;
 Mon, 20 Feb 2017 14:20:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.9.155 with HTTP; Mon, 20 Feb 2017 14:20:39 -0800 (PST)
From: Andrew Geissler <geissonator@gmail.com>
Date: Mon, 20 Feb 2017 16:20:39 -0600
Message-ID: <CALLMt=r62pSsVx+5DRsyxRThX0WahOO8wk5ENcc+t7ZfyoPoVw@mail.gmail.com>
Subject: Target name refactoring
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Mon, 20 Feb 2017 22:20:42 -0000

Some design decisions came out of my last set of changes in the
OpenBMC state area.  There was a proposal to rename our targets
responsible for booting and powering on/off the system.

Currently we have this:
- PowerOn: obmc-power-chassis-on.target    obmc-chassis-start.target
- PowerOff: obmc-power-chassis-off.target    obmc-chassis-stop.target
  obmc-stop-host.target

The obmc-power-chassis-*.targets are responsible for doing whatever is
required to apply pgood to the chassis.
The obmc-chassis-*.targets are responsible for starting and stopping
all host related services
The obmc-stop-host.target is where we have the soft power off service
(notify host of shutdown, wait for host to shutdown gracefully)

Refactoring Proposal:
- First the chassis-start and chassis-stop target names don=E2=80=99t make
sense anymore with the new bmc, chassis, and host state break down=E2=80=99=
s
so:
  - Rename obmc-chassis-start.target to obmc-start-host.target
  - Rename obmc-chassis-stop.target to obmc-stop-host.target
  - Rename the current obmc-stop-host.target to obmc-shutdown-host.target

The target relationships are then the following:

obmc-host-start.target requires obmc-power-chassis-on.target
obmc-shutdown-host.target requires obmc-stop-host.target requires
obmc-power-chassis-off.target

When a system goes to the quiesce target, the host state manager will
call the obmc-stop-host.target.  Otherwise, the host state service
will call the obmc-shutdown-host.target when power off is requested.

Thoughts/Comments?
Andrew

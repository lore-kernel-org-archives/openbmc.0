Return-Path: <dhruvaraj@gmail.com>
Received: from mail-it0-x22d.google.com (mail-it0-x22d.google.com
 [IPv6:2607:f8b0:4001:c0b::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wXFWz3G8mzDqQP
 for <openbmc@lists.ozlabs.org>; Tue, 23 May 2017 22:41:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="fDybbjVE"; 
 dkim-atps=neutral
Received: by mail-it0-x22d.google.com with SMTP id o5so18290701ith.1
 for <openbmc@lists.ozlabs.org>; Tue, 23 May 2017 05:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=uRLj5e1RYN6DWtS2RCsDLWqmzS39bCBFy3o15W00GTo=;
 b=fDybbjVEuRjRFwkD38FbdxhD0dNPHK6XZP65QuN+aDnp/BsWGyMQpKkCwnx+zwd2x2
 hD0e8CIyXm+u8bpqBVqY0XhprLedPNsoaLtgNR4VTo+kvK8U3z0zRBQCrzyKA+Q0xzR9
 faAXzMYG/Wy4R/MJXdl9B3N1wIYA09kF18yF1FAVj5tULR1YENNqKCk29zSkiX6RJxlH
 GDZ4Qb0VZuF65BcG1BdtIsJTylqIFQRvI+TP1SvUwaLaAGGP1+Coknlbt4QO1x/urOh2
 9Rt8ipLD3MGkTPn1IVDxeh5u8rZ2kSEZhahElgZoXr4VSsPlukRFbL6lEyogp5npFnpW
 w6Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=uRLj5e1RYN6DWtS2RCsDLWqmzS39bCBFy3o15W00GTo=;
 b=dAXkmT7ByOT8XzwIrZKVgY3bk77BohSwaB41gVx4Mut+kf0RZRoUvK7PWLXg1BoIxO
 ITUzJFV8Z+Xr5QeKUJMqa5rYWkbG5A1bxwmuanCSkBDJYU/q16FP6hjGFgPbgl1xNecN
 /wJ+bpDkeNV3+mRAAQIAQOpPr/ltd7YO+1zBEl7s2L0H5KhjQSUCuIorPdNc9H+9+rGI
 Uxz6BDGrRlQxznpVTNtlF1ay61ovtsgWPqpvmql0Xu/09XMLBc6OyoQiHr1ay7wacZtt
 +L9TTOO1b1IKyYJGvho5N+YZg+A6f1saPdmoYkROgwyq9P4p2XI7WJ3naebBW8INjqT6
 MKVg==
X-Gm-Message-State: AODbwcDnPFnnY+rmJf63fQX8MHZcOzlsqRYNRGgCrJ3kfsAAmmK4Udp0
 cYQosEWZ1KD5IHFOyknSjWQI2DCWalYY
X-Received: by 10.36.103.9 with SMTP id u9mr2493062itc.2.1495543291884; Tue,
 23 May 2017 05:41:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.209.117 with HTTP; Tue, 23 May 2017 05:41:11 -0700 (PDT)
From: dhruvaraj S <dhruvaraj@gmail.com>
Date: Tue, 23 May 2017 18:11:11 +0530
Message-ID: <CAK7Wosjh3yqp3Peik0c9=jifT9t29vsdR7oJyPqx8=oh17Q+bw@mail.gmail.com>
Subject: Issue:#798: Design proposal.
To: openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Tue, 23 May 2017 12:41:36 -0000

HI All,


Please review the design proposal for the issue -
https://github.com/openbmc/openbmc/issues/798 (Model non-sensor
sensors), which I am working on the current sprint.

As part of this issue I was planning to implement following sensors.

1) BootCount
2) BootProgress
3) OperatingSystemStatus
4) OccStatus

Based on the design discussion following sensors will be handled once
power handling is implemented
5) PowerSupplyDerating
6) PowerSupplyRedundancy

Note: More details of these sensors are available in the MRW

Proposed paths and interfaces for the sensors.

BootCount :
Path: /xyz/openbmc_project/state/host0
Interface: xyz.openbmc_project.State.Boot.Count
Property: BootCount
                Type:uint32

BootProgress:
Path: /xyz/openbmc_project/state/host0
Interface: xyz.openbmc_project.State.Boot.Progress
Property: BootProgress
                Type: String

OperatingSystemStatus:
Path: /xyz/openbmc_project/state/host0
Interface: xyz.openbmc_project.State.OperatingSystem.Status
Property: OperatingSystemState
                Type: String

OccStatus
Path: org/open_power/OCC
Interface: org.open_power.OCC.proc0.status
Property: OCCActive
                Type: bool

OccStatus
Path: org/open_power/OCC
Interface: org.open_power.OCC.proc1.status
Property: OCCActive
                Type: bool


Implementation details:

- BootCount, BootProgress and OperatingSystem status will be
implemented in  phosphor-state-manager.
- OccStatus will be implemented in openpower-occ-control.
- MRW will be parsed based on the input config yaml(refer the
structure below) and create an application specific output yaml(refer
example below)
- Output yaml will be used to link between the IPMI sensor IDs and
DBus interfaces for host Ipmid to handle the incoming IPMI requests.

Config Yaml;

IPMI_SENSOR_ID:
                               DBus Interface
                               Property
                                           type: =E2=80=9Ctype=E2=80=9D

The output YAML will contain the mapping for values coming to
host-ipmi from host and the expected value by the DBus interface.
.
Output Yaml example:

0x09:

    /org/open_power/OCC:

        /org.open_power.OCC.proc0.status

       type: =E2=80=9Cbool=E2=80=9D



--=20
--------------
Dhruvaraj S

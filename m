Return-Path: <wangzqbj@inspur.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=inspur.com
 (client-ip=162.243.126.186; helo=vip.corpemail.net;
 envelope-from=wangzqbj@inspur.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=inspur.com
Received: from vip.corpemail.net (vip.corpemail.net [162.243.126.186])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Nr0n5Kj4zDqJH
 for <openbmc@lists.ozlabs.org>; Tue, 19 Mar 2019 22:09:27 +1100 (AEDT)
Received: from ([60.208.111.195])
 by unicom145.biz-email.net (Antispam) with ASMTP (SSL) id KOV37337
 for <openbmc@lists.ozlabs.org>; Tue, 19 Mar 2019 19:02:37 +0800
Received: from mail-lf1-f42.google.com (10.100.1.52) by
 jtjnmail201608.home.langchao.com (10.100.2.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1591.10; Tue, 19 Mar 2019 19:02:16 +0800
Received: by mail-lf1-f42.google.com with SMTP id d18so14091415lfn.3
 for <openbmc@lists.ozlabs.org>; Tue, 19 Mar 2019 04:02:35 -0700 (PDT)
X-Gm-Message-State: APjAAAWvJIAA8MEA7vInXAvHHcO1CfSfbvcR9/CHe9TyuUyn/UXcOzgC
 2GW7YUhFtGb70OmnTElG6jSGZUMLOr+izNi+uD0=
X-Google-Smtp-Source: APXvYqwfoYL5v9cUXXxdQW6B6Tpc4lfAbOEUwOH1MCP0CxpYDtW3OtAjO3YK7GLL0iLpGc8sJ67Sq2pTecXeoBBRy/g=
X-Received: by 2002:ac2:4304:: with SMTP id l4mr12095102lfh.168.1552993353418; 
 Tue, 19 Mar 2019 04:02:33 -0700 (PDT)
MIME-Version: 1.0
From: John Wang <wangzqbj@inspur.com>
Date: Tue, 19 Mar 2019 19:02:22 +0800
X-Gmail-Original-Message-ID: <CAHkHK08Otxm88OQGjG+b0QEgv_mExyObqOj6aZGSwmzMfZO_mw@mail.gmail.com>
Message-ID: <CAHkHK08Otxm88OQGjG+b0QEgv_mExyObqOj6aZGSwmzMfZO_mw@mail.gmail.com>
Subject: [fru-device and intel-ipmi-oem] ipmitool fru print can not output psu
 information
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.100.1.52]
X-ClientProxiedBy: jtjnmail201608.home.langchao.com (10.100.2.8) To
 jtjnmail201608.home.langchao.com (10.100.2.8)
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
X-List-Received-Date: Tue, 19 Mar 2019 11:09:31 -0000

By checking the code, I found that fru-device seems to need to be used
with intel-ipmi-oem,
and it seems that no additional configuration is required(correct??).

On my machine,there are two FRU,one is /etc/fru/baseboard.fru.bin,the
other is psu fru.
(There is only one psu).

But,ipmitool fru print can only output the fru of baseboard.
$ ipmitool -I lanplus -H 100.2.76.213 -U root -P 0penBmc fru print
FRU Device Description : Builtin FRU Device (ID 0)

fru-device found psu itself and had the correct output on dbus:
busctl tree xyz.openbmc_project.FruDevice
=E2=94=94=E2=94=80/xyz
  =E2=94=94=E2=94=80/xyz/openbmc_project
    =E2=94=94=E2=94=80/xyz/openbmc_project/FruDevice
      =E2=94=9C=E2=94=80/xyz/openbmc_project/FruDevice/DPS_800AB_16_A
      =E2=94=94=E2=94=80/xyz/openbmc_project/FruDevice/ON5263M5
busctl introspect xyz.openbmc_project.FruDevice
/xyz/openbmc_project/FruDevice/DPS_800AB_16_A:      -
.ADDRESS                            property  u         80
  emits-change
.BUS                                property  u         5
  emits-change
.Common_Format_Version              property  s         "1"
  emits-change
.PRODUCT_LANGUAGE_CODE              property  s         "25"
  emits-change
.PRODUCT_MANUFACTURER               property  s         "DELTA"
  emits-change
.PRODUCT_PART_NUMBER                property  s         "          "
  emits-change
.PRODUCT_PRODUCT_NAME               property  s         "DPS-800AB-16
A" emits-change
.PRODUCT_SERIAL_NUMBER              property  s
"HERD1629002309" emits-change
.PRODUCT_VERSION                    property  s         "S2F"
  emits-change

Intel-ipmi-oem:
Commit fcce83df799d9580f48b7f793989c9c96bc882e0
Author: James Feist <james.feist@linux.intel.com>
Date: Fri Mar 1 15:46:19 2019 -0800

The configuration of psu in entity-manager is as follows:
[
    {
        "Exposes": [
            {
                "Address": "0x58",
                "Bus": "$bus",
                "Name": "Delta DPS-800AB-16 PSU Device",
                "Type": "pmbus"
            },
{
                "Address": "$address",
                "Bus": "$bus",
                "Name": "Delta DPS-800AB-16 PSU FRU",
                "Type": "EEPROM"
            }

        ],
        "Name": "PSU",
        "Probe":
"xyz.openbmc_project.FruDevice({'PRODUCT_PRODUCT_NAME': 'DPS-800AB-16
A'})",
        "Type": "PowerSupply",
        "xyz.openbmc_project.Inventory.Decorator.Asset": {
            "Manufacturer": "$PRODUCT_MANUFACTURER",
            "Model": "$PRODUCT_PRODUCT_NAME",
            "PartNumber": "$PRODUCT_PART_NUMBER",
            "SerialNumber": "$PRODUCT_SERIAL_NUMBER"
        }
    }
]


Can anyone help me figure out what configuration information is missing?

Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::22b; helo=mail-lf0-x22b.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="JJn2u1g7"; 
 dkim-atps=neutral
Received: from mail-lf0-x22b.google.com (mail-lf0-x22b.google.com
 [IPv6:2a00:1450:4010:c07::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7fVW4TcbzDql7
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 17:14:27 +1100 (AEDT)
Received: by mail-lf0-x22b.google.com with SMTP id q132so19213902lfe.5
 for <openbmc@lists.ozlabs.org>; Thu, 05 Oct 2017 23:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:from:date:message-id:subject:to;
 bh=96LKDeLx0UqUrXFu64hyLyc2WTy8CA3XA74IwvxMPn4=;
 b=JJn2u1g7aKMTWXgLPM/GjKD8Ypnk3HHFRwD864KiiGP0QucOJJZEBGXzrbbgiwLQ2l
 w+/13gijnbL7vJJhujxkDvp1AFnOT6cNj6X+OzJ0pTiMKdPq01PbCy46sIXrCfDvL0uT
 bRBALwsB+/8DfX/G0m0G334jZmKG2we6UbaZuUpL6gvNSb9N4c+g01mvv5hERmDLUA0F
 5s9UVwZRvjFO98sPNMILSlRaj0CaTbs7TJpFsMQE8Q2NrG/dpG1scayUnI9WXHip24L4
 3sPeOHUAM6NYJED6j91Xp95rV7t6gbqIcbvh8KwBAaE7EbF/LaCzoqdvrxn/YCfSNt+k
 1DkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
 :to; bh=96LKDeLx0UqUrXFu64hyLyc2WTy8CA3XA74IwvxMPn4=;
 b=Zw9VyJWAXDqXdSY4JBfZDqtUNHMIjZZnc79KiwwFqRfhoLq0ygZDu2XPC1qQ4HDHG/
 QMXvjFPJeMYnWtenL1GtjfgJPWye+2ithmb2wL82POZVeh/JBIH2xXj+fLpYHhTjq+ID
 e49v0sV8Kl3AiEm5ovlhGYGAWUgn2M9yrTSbUH7WDll2dyRaBk6VOx7h/WlYXWjMf1Kh
 lpORfjyOMsVOotPCKWcyVbGB2EIh96XCDTZg99lPkJZE6mm4icJmuWXf+/NQT9g2HKFi
 A2LN0JT/6ds2mvE5/X+NjNp+2hhUTe4MJ7dv0i7NhmL11zRkCGSHsdExJeDOQvCJFO7f
 SQHQ==
X-Gm-Message-State: AMCzsaXU3A5K/FgL2L/o6AJs/x/4zL9qD8bZFvhwLQiNDHuO8css5VHR
 tZQLflhYDtoyxG/LlzPLndvjbAY1Qbmh0YqD+dsemq6m
X-Google-Smtp-Source: AOwi7QCejRTRTyo4J86x+iSB3+rfnHuQT+WtGjm+h7NudLM9p/EEbaG2QlE8WR0+VxiwDZcizeHDcNLl4Igo9W0K2VM=
X-Received: by 10.25.23.38 with SMTP id n38mr380793lfi.104.1507270463756; Thu,
 05 Oct 2017 23:14:23 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.195.6 with HTTP; Thu, 5 Oct 2017 23:14:02 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 6 Oct 2017 15:44:02 +0930
X-Google-Sender-Auth: wRmkb4Ox6DgRI_eoVffZWL1xu7s
Message-ID: <CACPK8XePX_4SNpREUVYPHK+NfpDgM7Lh20tAsWSMKYpjTJ3r=w@mail.gmail.com>
Subject: Linux i2c slave EEPROM
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/mixed; boundary="001a1140766c92ba22055adac092"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Oct 2017 06:14:28 -0000

--001a1140766c92ba22055adac092
Content-Type: text/plain; charset="UTF-8"

Hello,

Back when reviewing the upstream i2c driver I used the slave-eeprom
support in the kernel to test the slave support. I've had some
questions about this recently, so here are the steps I used on my
ast2500 EVB.

Grab a recent Linux kernel with ASPEED i2c support. I used 4.14 with
my in-progress clock driver applied, but dev-4.10 should work too.

1. Connect I2C1 and I2C2 SCL and SDA lines

The pins are on the south edge of the board, towards the south-west
corner when reading the ASPEED Technolgoy Inc silkscreen up the
correct way. A jumper should be able to reach between them.

2. Apply the attached patch to your tree

$ cd linux-aspeed
$ patch -p1 < 0001-ARM-dts-aspeed-evb-Enable-EEPROM-i2c-slave.patch

3. Build the kernel and fit image. Use your favourite FIT and initrd
or root file system.

$ cd linux-aspeed
$ make aspeed_g5_defconfig
$ make
$ mkimage -f evb.fit evb

4. Boot the 'evb' fit image on your evb

5. Bind some drivers

# echo slave-24c02 0x1064 > /sys/bus/i2c/devices/i2c-1/new-device
# i2cdetect -y 1
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:          -- -- -- -- -- -- -- -- -- -- -- -- --
10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
60: -- -- -- -- UU -- -- -- -- -- -- -- -- -- -- --
70: -- -- -- -- -- -- -- --

# echo 24c02 0x64 > /sys/bus/i2c/devices/i2c-2/new_device
# i2cdetect -y 2
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:          -- -- -- -- -- -- -- -- -- -- -- -- --
10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
60: -- -- -- -- UU -- -- -- -- -- -- -- -- -- -- --
70: -- -- -- -- -- -- -- --

6. Find the eeprom sysfs files

# find /sys/devices/ -name slave-eeprom
/sys/devices/platform/ahb/ahb:apb/ahb:apb:i2c@1e78a000/1e78a0c0.i2c-bus/i2c-2/2-0064/slave-eeprom

And the 'host' side of the eeprom is here. The one on bus i2c-3 is the
real EEPROM; ignore it.

#  find /sys/devices -name eeprom
/sys/devices/platform/ahb/ahb:apb/ahb:apb:i2c@1e78a000/1e78a0c0.i2c-bus/i2c-2/2-0064/eeprom
/sys/devices/platform/ahb/ahb:apb/ahb:apb:i2c@1e78a000/1e78a100.i2c-bus/i2c-3/3-0050/eeprom

7.  Create some environment variables:
HOST=/sys/devices/platform/ahb/ahb:apb/ahb:apb:i2c@1e78a000/1e78a0c0.i2c-bus/i2c-2/2-0064/eeprom
SLAVE=/sys/devices/platform/ahb/ahb:apb/ahb:apb:i2c@1e78a000/1e78a0c0.i2c-bus/i2c-2/2-0064/slave-eeprom

8. Write to one, and see it appear in the other

# echo "How about a nice game of chess?" > $SLAVE
# cat $HOST
How about a nice game of chess?
# hexdump -C $HOST
00000000  48 6f 77 20 61 62 6f 75  74 20 61 20 6e 69 63 65  |How about a nice|
00000010  20 67 61 6d 65 20 6f 66  20 63 68 65 73 73 3f 0a  | game of chess?.|
00000020  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|

# echo "You have no chance to survive make your time" > $HOST
# hexdump -C $SLAVE
00000000  59 6f 75 20 68 61 76 65  20 6e 6f 20 63 68 61 6e  |You have no chan|
00000010  63 65 20 74 6f 20 73 75  72 76 69 76 65 20 6d 61  |ce to survive ma|
00000020  6b 65 20 79 6f 75 72 20  74 69 6d 65 0a 00 00 00  |ke your time....|
00000030  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|

Cheers,

Joel

--001a1140766c92ba22055adac092
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-ARM-dts-aspeed-evb-Enable-EEPROM-i2c-slave.patch"
Content-Disposition: attachment; 
	filename="0001-ARM-dts-aspeed-evb-Enable-EEPROM-i2c-slave.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_j8fhjk2t0

RnJvbSBjZjg5OWFkYTQ4ZTBkMmRjZGNlYzJiNjViYjcyYTYxMjA4MzczNmViIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBKb2VsIFN0YW5sZXkgPGpvZWxAam1zLmlkLmF1PgpEYXRlOiBG
cmksIDYgT2N0IDIwMTcgMTU6Mzc6MTggKzEwMzAKU3ViamVjdDogW1BBVENIXSBBUk06IGR0czog
YXNwZWVkLWV2YjogRW5hYmxlIEVFUFJPTSBpMmMgc2xhdmUKClRoaXMgZW5hYmxlcyBJMkMyICgv
ZGV2L2kyYzEgaW4gTGludXgpIGFuZCBJMkMzICgvZGV2L2kyYzIpLgoKVG8gdGVzdCwgZG8gdGhl
IGZvbGxvd2luZyBmcm9tIHVzZXJzcGFjZToKCiAjIGVjaG8gc2xhdmUtMjRjMDIgMHgxMDY0ID4g
L3N5cy9idXMvaTJjL2RldmljZXMvaTJjLTEvbmV3LWRldmljZQogIyBlY2hvIDI0YzAyIDB4NjQg
PiAvc3lzL2J1cy9pMmMvZGV2aWNlcy9pMmMtMi9uZXdfZGV2aWNlCgpTZWUgdGhlIGRvY3VtZW50
YXRpb24gZm9yIG1vcmUgZGV0YWlsczoKCiBEb2N1bWVudGF0aW9uL2kyYy9zbGF2ZS1lZXByb20t
YmFja2VuZAogRG9jdW1lbnRhdGlvbi9pMmMvc2xhdmUtaW50ZXJmYWNlCgpTaWduZWQtb2ZmLWJ5
OiBKb2VsIFN0YW5sZXkgPGpvZWxAam1zLmlkLmF1PgotLS0KIGFyY2gvYXJtL2Jvb3QvZHRzL2Fz
cGVlZC1hc3QyNTAwLWV2Yi5kdHMgfCA4ICsrKysrKysrCiBhcmNoL2FybS9jb25maWdzL2FzcGVl
ZF9nNV9kZWZjb25maWcgICAgIHwgMiArKwogMiBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWFzdDI1MDAtZXZiLmR0
cyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1hc3QyNTAwLWV2Yi5kdHMKaW5kZXggMGQ4NTc5
ZDkwZThkLi42ZDM0YTBjZDJiYWIgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL2FzcGVl
ZC1hc3QyNTAwLWV2Yi5kdHMKKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWFzdDI1MDAt
ZXZiLmR0cwpAQCAtNzksNiArNzksMTQgQEAKIAl9OwogfTsKIAorJmkyYzEgeworCXN0YXR1cyA9
ICJva2F5IjsKK307CisKKyZpMmMyIHsKKwlzdGF0dXMgPSAib2theSI7Cit9OworCiAmaTJjNyB7
CiAJc3RhdHVzID0gIm9rYXkiOwogCmRpZmYgLS1naXQgYS9hcmNoL2FybS9jb25maWdzL2FzcGVl
ZF9nNV9kZWZjb25maWcgYi9hcmNoL2FybS9jb25maWdzL2FzcGVlZF9nNV9kZWZjb25maWcKaW5k
ZXggMDc4YmRiZTMyZWJlLi41MDMwNWMyNTMzZjkgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2NvbmZp
Z3MvYXNwZWVkX2c1X2RlZmNvbmZpZworKysgYi9hcmNoL2FybS9jb25maWdzL2FzcGVlZF9nNV9k
ZWZjb25maWcKQEAgLTEyMSw2ICsxMjEsOCBAQCBDT05GSUdfSTJDX01VWD15CiBDT05GSUdfSTJD
X01VWF9QQ0E5NTQxPXkKIENPTkZJR19JMkNfTVVYX1BDQTk1NHg9eQogQ09ORklHX0kyQ19BU1BF
RUQ9eQorQ09ORklHX0kyQ19TTEFWRT15CitDT05GSUdfSTJDX1NMQVZFX0VFUFJPTT15CiBDT05G
SUdfR1BJT0xJQj15CiBDT05GSUdfR1BJT19TWVNGUz15CiBDT05GSUdfR1BJT19BU1BFRUQ9eQot
LSAKMi4xNC4xCgo=
--001a1140766c92ba22055adac092--

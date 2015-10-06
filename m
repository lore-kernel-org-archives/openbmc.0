Return-Path: <brad@bwbmail.net>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id B00F21A0034
 for <openbmc@lists.ozlabs.org>; Tue,  6 Oct 2015 17:05:53 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@bajor.fuzziesquirrel.com
From: Brad Bishop <brad@bwbmail.net>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_83FA4EED-EAFC-43B4-9C6B-83F0D1095311"
Subject: Palmetto netboot instructions
Message-Id: <B4E73D93-EAC0-4F2F-A1F1-74D969EDBDE8@bwbmail.net>
Date: Tue, 6 Oct 2015 02:05:44 -0400
To: openbmc@lists.ozlabs.org
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Oct 2015 06:05:54 -0000


--Apple-Mail=_83FA4EED-EAFC-43B4-9C6B-83F0D1095311
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Please let me know if you run into any problems with this procedure or =
have any feedback.  Thanks.

On build system:

1 - pull updates from here: https://github.com/bradbishop/openbmc-1 =
<https://github.com/bradbishop/openbmc-1>
2 - bitbake obmc-phosphor-image
3 - tmp/sysroots/x86_64-linux/usr/bin/mkimage -A arm -O linux -C none -T =
ramdisk -a 0x50200000 -d =
tmp/deploy/images/palmetto/obmc-phosphor-image-palmetto.cpio.gz initrd
4 - scp tmp/deploy/images/palmetto/cuImage <tftp>:/tftpboot
5 - scp tmp/deploy/images/palmetto/initrd <tftp>:/tftpboot


On BMC (uboot shell):

for static ip:
setenv gatewayip=3D<routers>
setenv netmask=3D<netmask>
setenv ipaddr=3D<ip>
setenv serverip=3D<tftp>
setenv netboot=3Dncsi\; tftp 0x50000000 /tftpboot/cuImage\; tftp =
0x50200000 /tftpboot/initrd\; bootm 0x50000000 0x50200000\;
saveenv
run netboot

for dynamic ip:
setenv serverip=3D<tftp>
setenv netboot=3Dncsi\; dhcp\; tftp 0x50000000 /tftpboot/cuImage\; tftp =
0x50200000 /tftpboot/initrd\; bootm 0x50000000 0x50200000\;
saveenv
run netboot=

--Apple-Mail=_83FA4EED-EAFC-43B4-9C6B-83F0D1095311
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D"">Please let me know if you run into any problems with this =
procedure or have any feedback. &nbsp;Thanks.<div class=3D""><br =
class=3D""></div><div class=3D"">On build system:</div><div class=3D""><br=
 class=3D""></div><div class=3D"">1 - pull updates from here:&nbsp;<a =
href=3D"https://github.com/bradbishop/openbmc-1" =
class=3D"">https://github.com/bradbishop/openbmc-1</a></div><div =
class=3D"">2 - bitbake obmc-phosphor-image</div><div class=3D"">3 - =
tmp/sysroots/x86_64-linux/usr/bin/mkimage -A arm -O linux -C none -T =
ramdisk -a 0x50200000 -d =
tmp/deploy/images/palmetto/obmc-phosphor-image-palmetto.cpio.gz =
initrd</div><div class=3D"">4 - scp tmp/deploy/images/palmetto/cuImage =
&lt;tftp&gt;:/tftpboot</div><div class=3D""><div class=3D"">5 - scp =
tmp/deploy/images/palmetto/initrd &lt;tftp&gt;:/tftpboot</div></div><div =
class=3D""><br class=3D""></div><div class=3D""><br class=3D""></div><div =
class=3D"">On BMC (uboot shell):</div><div class=3D""><br =
class=3D""></div><div class=3D"">for static ip:</div><div class=3D""><div =
class=3D"">setenv gatewayip=3D&lt;routers&gt;</div><div class=3D"">setenv =
netmask=3D&lt;netmask&gt;</div><div class=3D"">setenv =
ipaddr=3D&lt;ip&gt;</div><div class=3D"">setenv =
serverip=3D&lt;tftp&gt;</div><div class=3D"">setenv netboot=3Dncsi\; =
tftp 0x50000000 /tftpboot/cuImage\; tftp 0x50200000 /tftpboot/initrd\; =
bootm 0x50000000 0x50200000\;</div></div><div class=3D"">saveenv</div><div=
 class=3D"">run netboot</div><div class=3D""><br class=3D""></div><div =
class=3D"">for dynamic ip:</div><div class=3D""><div class=3D""><div =
class=3D"">setenv serverip=3D&lt;tftp&gt;</div><div class=3D"">setenv =
netboot=3Dncsi\; dhcp\; tftp 0x50000000 /tftpboot/cuImage\; tftp =
0x50200000 /tftpboot/initrd\; bootm 0x50000000 =
0x50200000\;</div></div><div class=3D"">saveenv</div><div class=3D"">run =
netboot</div></div></body></html>=

--Apple-Mail=_83FA4EED-EAFC-43B4-9C6B-83F0D1095311--

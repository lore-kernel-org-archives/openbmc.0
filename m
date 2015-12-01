Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id C32A61A0295
 for <openbmc@lists.ozlabs.org>; Wed,  2 Dec 2015 03:50:30 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1448988623823743.4421651691617;
 Tue, 1 Dec 2015 08:50:23 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 2/2] systemd/networkd patch (not in upstream) DBUS API
 to configure network interface.
Date: Tue,  1 Dec 2015 11:50:21 -0500
Message-Id: <1448988621-12834-3-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1448988621-12834-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1448988621-12834-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 01 Dec 2015 16:50:31 -0000

From: Hariharasubramanian R <hramasub@in.ibm.com>

---
 .../0100-systemd_networkd_dbus_setaddress.patch    | 255 +++++++++++++++++++++
 .../meta/recipes-core/systemd/systemd_225.bb       |   3 +-
 2 files changed, 257 insertions(+), 1 deletion(-)
 create mode 100644 yocto-poky/meta/recipes-core/systemd/systemd/0100-systemd_networkd_dbus_setaddress.patch

diff --git a/yocto-poky/meta/recipes-core/systemd/systemd/0100-systemd_networkd_dbus_setaddress.patch b/yocto-poky/meta/recipes-core/systemd/systemd/0100-systemd_networkd_dbus_setaddress.patch
new file mode 100644
index 0000000..3ca23c6
--- /dev/null
+++ b/yocto-poky/meta/recipes-core/systemd/systemd/0100-systemd_networkd_dbus_setaddress.patch
@@ -0,0 +1,255 @@
+From 946d0bac014f2def506812aec19961fab813b0dd Mon Sep 17 00:00:00 2001
+From: Hariharasubramanian R <hramasub@in.ibm.com>
+Date: Tue, 1 Dec 2015 07:37:14 -0600
+Subject: [PATCH] DBUS API support for systemd/networkd to configure the
+ interface parameters.
+
+---
+ src/network/networkd-network-bus.c | 108 +++++++++++++++++++++++++++++++++++++
+ src/network/networkd-network.c     |  85 +++++++++++++++++++++++++++++
+ 2 files changed, 193 insertions(+)
+
+diff --git a/src/network/networkd-network-bus.c b/src/network/networkd-network-bus.c
+index 5717a15..6f20d2d 100644
+--- a/src/network/networkd-network-bus.c
++++ b/src/network/networkd-network-bus.c
+@@ -19,10 +19,27 @@
+   along with systemd; If not, see <http://www.gnu.org/licenses/>.
+ ***/
+ 
++#define SYSTEMD_NETWORKD_DBUS 1
++
++#ifdef SYSTEMD_NETWORKD_DBUS
++#include <netinet/ether.h>
++#include <linux/if.h>
++#endif
++
+ #include "strv.h"
+ 
+ #include "networkd.h"
+ 
++#ifdef SYSTEMD_NETWORKD_DBUS
++#include "hostname-util.h"
++#include "network-internal.h"
++#include "networkd-link.h"
++#endif
++
++#ifdef SYSTEMD_NETWORKD_DBUS
++int network_address_added_handler (sd_netlink* rtnl, sd_netlink_message* m, void* userdata);
++#endif
++
+ static int property_get_ether_addrs(
+                 sd_bus *bus,
+                 const char *path,
+@@ -56,6 +73,10 @@ static int property_get_ether_addrs(
+         return sd_bus_message_close_container(reply);
+ }
+ 
++#ifdef SYSTEMD_NETWORKD_DBUS
++static int method_set_address (sd_bus_message *m, void* userdata, sd_bus_error *error);
++#endif
++
+ const sd_bus_vtable network_vtable[] = {
+         SD_BUS_VTABLE_START(0),
+ 
+@@ -67,6 +88,10 @@ const sd_bus_vtable network_vtable[] = {
+         SD_BUS_PROPERTY("MatchType", "as", NULL, offsetof(Network, match_type), SD_BUS_VTABLE_PROPERTY_CONST),
+         SD_BUS_PROPERTY("MatchName", "as", NULL, offsetof(Network, match_name), SD_BUS_VTABLE_PROPERTY_CONST),
+ 
++#ifdef SYSTEMD_NETWORKD_DBUS
++	    /* index, IP, netmask, family, flags, scope, gateway */
++    	SD_BUS_METHOD("SetAddress", "yssyyys", "x", method_set_address, SD_BUS_VTABLE_UNPRIVILEGED),
++#endif
+         SD_BUS_VTABLE_END
+ };
+ 
+@@ -152,3 +177,86 @@ int network_object_find(sd_bus *bus, const char *path, const char *interface, vo
+ 
+         return 1;
+ }
++
++#ifdef SYSTEMD_NETWORKD_DBUS
++static int method_set_address (sd_bus_message *m, void* userdata, sd_bus_error *error)
++{
++    _cleanup_address_free_ Address *addr = NULL;
++    _cleanup_route_free_ Route *rt = NULL;
++    unsigned char family;
++    unsigned char prefixlen;
++    unsigned char flags;
++    unsigned char scope;
++    unsigned char index;
++    const char* ipaddr;
++    const char* netmask;
++    const char* gateway;
++    struct in_addr nm;
++    struct in_addr ip;
++    struct in_addr gw;
++    Manager *mgr = userdata;
++    Link* link = NULL;
++    int r;
++
++    assert(m);
++    assert(mgr);
++
++    r = sd_bus_message_read (m, "yssyyys", &index, &ipaddr, &netmask, &family, &flags, &scope, &gateway);
++    if (r < 0)
++        return r;
++
++    if (isempty (ipaddr))
++        return sd_bus_error_setf(error, SD_BUS_ERROR_INVALID_ARGS, "Invalid IP Address '%s'", ipaddr);
++
++    if (isempty (netmask))
++        return sd_bus_error_setf(error, SD_BUS_ERROR_INVALID_ARGS, "Invalid IP Netmask '%s'", netmask);
++
++    inet_aton (netmask, &nm);
++    inet_aton (ipaddr, &ip);
++    inet_aton (gateway, &gw);
++
++    prefixlen = in_addr_netmask_to_prefixlen(&nm);
++
++    r = address_new_dynamic(&addr);
++    if (r < 0)
++        return sd_bus_error_setf(error, SD_BUS_ERROR_NO_MEMORY, "Error allocating new address");
++
++    r = link_get (mgr, index, &link);
++    if (r == -ENODEV)
++        return sd_bus_error_setf(error, SD_BUS_ERROR_BAD_ADDRESS, "No such Device at index ['%d'].", index);
++    else if (r < 0)
++        return sd_bus_error_setf(error, SD_BUS_ERROR_BAD_ADDRESS, "Unknown Device error at index ['%d'].", index);
++
++    r = link_initialized (link, link->udev_device);
++    if (r < 0)
++        /*return sd_bus_error_setf(error, SD_BUS_ERROR_IO_ERROR, "Device ['%s'] not ready.", link->udev_device->device->devpath);*/
++        return sd_bus_error_setf(error, SD_BUS_ERROR_IO_ERROR, "Device not ready.");
++
++    addr->family = AF_INET;
++    addr->in_addr.in.s_addr = ip.s_addr;
++    addr->prefixlen = prefixlen;
++    addr->broadcast.s_addr = ip.s_addr | ~nm.s_addr;
++
++    /* FIXME: Save default gateway in link->network->static_routes */
++    r = route_new_dynamic(&rt, RTPROT_STATIC);
++    if (r < 0)
++        return r;
++
++    rt->protocol = RTPROT_STATIC;
++    rt->network = link->network;
++    rt->family = family;
++    rt->scope = RT_SCOPE_LINK;
++    rt->dst_prefixlen = 32; /* FIXME: AF_INET assumed */
++    rt->dst_addr.in = gw;
++    /*rt->gw = defgw;*/
++
++    LIST_PREPEND(routes, link->network->static_routes, rt);
++
++    /* send an nlmsg (RTM_NEWADDR) and append address to link address list */
++    r = address_update (addr, link, network_address_added_handler);
++    if (r < 0)
++        return r;
++
++    return 0;
++}
++#endif
+diff --git a/src/network/networkd-network.c b/src/network/networkd-network.c
+index 6587ea9..8a38050 100644
+--- a/src/network/networkd-network.c
++++ b/src/network/networkd-network.c
+@@ -32,6 +32,14 @@
+ #include "network-internal.h"
+ #include "dns-domain.h"
+ 
++#define SYSTEMD_NETWORKD_DBUS 1
++
++#ifdef SYSTEMD_NETWORKD_DBUS
++int network_address_added_handler (sd_netlink* rtnl, sd_netlink_message* m, void* userdata);
++int network_set_gateway (Link* link);
++static int route_handler(sd_netlink *rtnl, sd_netlink_message *m, void *userdata);
++#endif
++
+ static int network_load_one(Manager *manager, const char *filename) {
+         _cleanup_network_free_ Network *network = NULL;
+         _cleanup_fclose_ FILE *file = NULL;
+@@ -850,3 +858,80 @@ int config_parse_hostname(const char *unit,
+ 
+         return 0;
+ }
++
++#ifdef SYSTEMD_NETWORKD_DBUS
++int network_address_added_handler (sd_netlink* rtnl, sd_netlink_message* m, void* userdata)
++{
++        _cleanup_link_unref_ Link *link = userdata;
++        int r;
++
++        assert(link);
++
++        r = sd_netlink_message_get_errno(m);
++        if (r < 0 && r != -EEXIST) {
++                log_debug("Error in set IP address!");
++                link_enter_failed(link);
++        } else if (r >= 0)
++                link_rtnl_process_address(rtnl, m, link->manager);
++
++	network_set_gateway (link);
++
++	return 1;
++}
++
++/* link_enter_set_routes */
++int network_set_gateway (Link* link)
++{
++        Route *rt;
++        int r;
++
++        assert(link);
++        assert(link->network);
++        assert(link->state == LINK_STATE_SETTING_ADDRESSES);
++
++        link->state = LINK_STATE_SETTING_ROUTES;
++
++        LIST_FOREACH(routes, rt, link->network->static_routes) {
++                r = route_configure(rt, link, &route_handler);
++                if (r < 0) {
++                        log_debug ("Could not set Gateway!");
++                        link_enter_failed(link);
++                        return r;
++                }
++
++                link->link_messages ++;
++        }
++
++        if (link->link_messages == 0) {
++                link->static_configured = true;
++                /*link_check_ready(link);*/
++        } else
++                log_debug("Setting Gateway");
++
++        return 0;
++}
++
++static int route_handler(sd_netlink *rtnl, sd_netlink_message *m, void *userdata) {
++        _cleanup_link_unref_ Link *link = userdata;
++        int r;
++
++        assert(link);
++        assert(link->dhcp4_messages);
++
++        link->dhcp4_messages --;
++
++        r = sd_netlink_message_get_errno(m);
++        if (r < 0 && r != -EEXIST) {
++                log_debug ("Could not set route! ");
++                link_enter_failed(link);
++        }
++
++        if (!link->dhcp4_messages) {
++                link->dhcp4_configured = true;
++                /*link_check_ready(link);*/
++        }
++
++        return 1;
++}
++
++#endif
+-- 
+1.8.2.2
+
diff --git a/yocto-poky/meta/recipes-core/systemd/systemd_225.bb b/yocto-poky/meta/recipes-core/systemd/systemd_225.bb
index f7d4c7d..eb3d879 100644
--- a/yocto-poky/meta/recipes-core/systemd/systemd_225.bb
+++ b/yocto-poky/meta/recipes-core/systemd/systemd_225.bb
@@ -41,6 +41,7 @@ SRC_URI = "git://github.com/systemd/systemd.git;protocol=git \
            file://0012-implment-systemd-sysv-install-for-OE.patch \
            file://0014-Revert-rules-remove-firmware-loading-rules.patch \
            file://0015-Revert-udev-remove-userspace-firmware-loading-suppor.patch \
+           file://0100-systemd_networkd_dbus_setaddress.patch \
            file://touchscreen.rules \
            file://00-create-volatile.conf \
            file://init \
@@ -74,7 +75,6 @@ PACKAGECONFIG[xz] = "--enable-xz,--disable-xz,xz"
 PACKAGECONFIG[cryptsetup] = "--enable-libcryptsetup,--disable-libcryptsetup,cryptsetup"
 PACKAGECONFIG[microhttpd] = "--enable-microhttpd,--disable-microhttpd,libmicrohttpd"
 PACKAGECONFIG[elfutils] = "--enable-elfutils,--disable-elfutils,elfutils"
-PACKAGECONFIG[resolved] = "--enable-resolved,--disable-resolved"
 PACKAGECONFIG[networkd] = "--enable-networkd,--disable-networkd"
 PACKAGECONFIG[libidn] = "--enable-libidn,--disable-libidn,libidn"
 PACKAGECONFIG[audit] = "--enable-audit,--disable-audit,audit"
@@ -413,3 +413,4 @@ python () {
     if not bb.utils.contains ('DISTRO_FEATURES', 'systemd', True, False, d):
         raise bb.parse.SkipPackage("'systemd' not in DISTRO_FEATURES")
 }
+}
-- 
2.6.3

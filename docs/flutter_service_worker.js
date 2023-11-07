'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "54fd35c017babe55b276e47fcffe6edb",
"icons/Icon-512.png": "73f53c28f6ec981d115f5bf93a9bf730",
"icons/Icon-192.png": "f6db6a35435b9988b426f33ad75a0d3c",
"main.dart.js": "892f2d55967643a274655eed1d481dff",
"index.html": "b1742ff57798b4e28775417fd5ad3d56",
"/": "b1742ff57798b4e28775417fd5ad3d56",
"manifest.json": "888ef79fa6552f2f46d10b19ab528ab9",
"canvaskit/profiling/canvaskit.js": "f3bfccc993a1e0bfdd3440af60d99df4",
"canvaskit/profiling/canvaskit.wasm": "a9610cf39260f60fbe7524a785c66101",
"canvaskit/canvaskit.js": "43fa9e17039a625450b6aba93baf521e",
"canvaskit/canvaskit.wasm": "04ed3c745ff1dee16504be01f9623498",
"favicon2.png": "1c0e872a97cbb0f8cafbab5ffb89e2ba",
"assets/packages/flutter_inappwebview/t_rex_runner/t-rex.html": "16911fcc170c8af1c5457940bd0bf055",
"assets/packages/flutter_inappwebview/t_rex_runner/t-rex.css": "5a8d0222407e388155d7d1395a75d5b9",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"assets/FontManifest.json": "7ebcbc66453674ce30535491d708f71a",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"assets/assets/icons/logo.png": "df152747389e16fb7378f9c1c7271cdd",
"assets/assets/icons/logo_vertical.png": "f4a72ad4d56ce97a48ed68b9156a41b1",
"assets/assets/icons/whats.png": "4a61828a38f0e4c26c1f3f5fdcc91110",
"assets/assets/images/mac.png": "fac6d6e6a780de954e3ea7846b416c54",
"assets/assets/images/estetoscopio.jpg": "a8e617cd44ba7850e8a0b1e827de2ec2",
"assets/assets/images/mod_paciente_assistencia.png": "6f6b128a4803d68109a236e85b1b48bd",
"assets/assets/images/login_mobile.png": "c90093921093db1c850634b100057cf9",
"assets/assets/images/trabalho.jpg": "9b17f897de67113328b31fd7b14cc3f5",
"assets/assets/images/mod_clinica_financeiro.png": "2affc8b32aa7b30c1e77ec5b0c8d811c",
"assets/assets/images/play_store.png": "d6174056d3803aede7110225cce41d47",
"assets/assets/images/mod_atendente_bloco.png": "547da5e55bdf5950daea38dc2d4192a9",
"assets/assets/images/app_store.png": "c7f32d2875687132cfb89197dc8fa388",
"assets/assets/images/mod_paciente.png": "5bb6fe0b0384f5b4915b47e4f4d804a3",
"assets/assets/images/iphone.png": "2bedeae4ffbd8d143c75bfe17ce2a2e3",
"assets/assets/images/mod_medico_prontuario.png": "f55b981ba1ba2b87674fc6f50594b736",
"assets/assets/images/mod_atendente_perfil.png": "c85330622ce22bcd26b82ad424f8edf3",
"assets/assets/images/modulo_clinica.png": "6b0bde504d56defadc2abf90d70bb277",
"assets/assets/images/mod_medico_assistencia.png": "75a1f85ba4421ee744ab8ee51fb98e6c",
"assets/assets/images/agenda.png": "2e6a077e0d47a8280d3d2ca855afc71a",
"assets/assets/images/clinica.jpg": "9bfa5c0a4d9476ea87b45ea968c9b00d",
"assets/assets/images/mod_atendente_consultas.png": "ea6d85891e4cf8b13ff907f13637a857",
"assets/assets/images/milton.gif": "78c405adfc3b60a03e4d4b5cb37a222e",
"assets/assets/images/modulo_diretor.png": "d802db3815e2102476ad302eb48810c7",
"assets/assets/images/medico.png": "68080773d03e70123af984e7f5acd570",
"assets/assets/images/mod_paciente_historico.png": "79d35e13c04a547706c919ab1794e424",
"assets/assets/images/mod_paciente_acompanhamento.png": "41a67d1ba92302706fdc497f482263f0",
"assets/assets/images/modulo_paciente.png": "a55eb230605a621e73f4731936ce1439",
"assets/assets/images/contrate.jpg": "06d7a7d3c34391dea380c557b99c425a",
"assets/assets/images/modulo_atendente.png": "0c9e7a4d44821b85195db06e6415cde9",
"assets/assets/images/mod_medico_historico.png": "0e89396e68252287bd568d9a75c48e02",
"assets/assets/images/mod_clinica_cadPaciente.png": "73f936cee71b5a4f11ab3040c1d5867a",
"assets/assets/images/usuario.png": "fe93cd2a8095411bb1c20357d7bcc275",
"assets/assets/images/mod_clinica_agenda.png": "0cc056cba3527dec6fe7893a17f7e4ac",
"assets/assets/images/modulo_medico.png": "eaf26c5877a287c84359c32bf21877e1",
"assets/assets/images/mod_clinica.png": "3087654e13f1ee9bc2d870760306053b",
"assets/assets/images/mod_clinica_cadFuncionarios.png": "64c09c8fd2c0920130ca7de016de014c",
"assets/assets/images/mod_atendente_salaespera.png": "fe184149ea16dc1fe91f3ac30c172ad4",
"assets/assets/images/bruno.jpeg": "f0ca6a6337872fae6a0331c39f38fcf0",
"assets/assets/images/painel.png": "0056acf1b482622a7caa4b08f1a8b206",
"assets/assets/fonts/Roboto-Italic.ttf": "465d1affcd03e9c6096f3313a47e0bf5",
"assets/assets/fonts/Roboto-Bold.ttf": "9ece5b48963bbc96309220952cda38aa",
"assets/assets/fonts/Roboto-Regular.ttf": "f36638c2135b71e5a623dca52b611173",
"assets/assets/fonts/Roboto-Medium.ttf": "b2d307df606f23cb14e6483039e2b7fa",
"assets/assets/audio/pronunciaHigia.m4a": "8254dd6a76097e926e4f7bab6cbc24bf",
"assets/NOTICES": "d8e83c967d20de7d7af141b7476223dd",
"assets/AssetManifest.json": "f02f6669b70c79e886e1694f6421f3bf",
"favicon.png": "f6db6a35435b9988b426f33ad75a0d3c"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}

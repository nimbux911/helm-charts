{{/* 
Generate common labels
 */}}
{{- define "base-app.common-labels" }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
app.kubernetes.io/name: {{ .Chart.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app: {{ .Release.Name }}
{{- if .Values.global }}
{{- if .Values.global.labels }}
{{- range $key, $val := .Values.global.labels }}
{{ $key }}: {{ $val | quote }}
{{- end }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Generate resources name.
*/}}
{{- define "base-app.resourceName" }}
{{- if .Values.global }}
{{- if .Values.global.fullNameOverride }}
{{- .Values.global.fullNameOverride }}
{{- else if .Values.global.nameOverride }}
{{ printf "%s-%s" .Release.Name .Values.global.nameOverride }}
{{- else }}
{{- .Release.Name }}
{{- end }}
{{- end }}
{{- end }}

